extends MeshInstance3D

var original_mesh: ArrayMesh
var sphere_radius: float
var last_elasticity: float = -1.0

func _ready():
	call_deferred("_init_mesh")

func _init_mesh():
	var rigid_body = get_parent().get_parent()  # Node3D → RigidBody3D

	# Get sphere radius from CollisionShape3D (direct child of RigidBody3D)
	var collision_shape = rigid_body.get_node("CollisionShape3D")
	var world_radius = collision_shape.shape.radius
	sphere_radius = world_radius / (rigid_body.scale.x * get_parent().scale.x * scale.x)

	# Convert imported mesh to ArrayMesh
	var imported = mesh
	var array_mesh = ArrayMesh.new()
	for surface in range(imported.get_surface_count()):
		array_mesh.add_surface_from_arrays(
			Mesh.PRIMITIVE_TRIANGLES,
			imported.surface_get_arrays(surface)
		)
		
		# Copy the material from each surface
		var material = imported.surface_get_material(surface)
		array_mesh.surface_set_material(surface, material)

	original_mesh = array_mesh

	# Initial inflation using elasticity
	var elasticity = rigid_body.elasticity
	mesh = inflate_toward_sphere(original_mesh, sphere_radius, elasticity)
	last_elasticity = elasticity


func _process(_delta):
	var rigid_body = get_parent().get_parent()
	var current = rigid_body.elasticity
	if current != last_elasticity:
		last_elasticity = current
		mesh = inflate_toward_sphere(original_mesh, sphere_radius, current)


func inflate_toward_sphere(original: ArrayMesh, radius: float, t: float) -> ArrayMesh:
	var mdt = MeshDataTool.new()
	mdt.create_from_surface(original, 0)

	for i in range(mdt.get_vertex_count()):
		var vertex = mdt.get_vertex(i)
		var on_sphere = vertex.normalized() * radius
		mdt.set_vertex(i, vertex.lerp(on_sphere, t))

	var new_mesh = ArrayMesh.new()
	mdt.commit_to_surface(new_mesh)
	return new_mesh
