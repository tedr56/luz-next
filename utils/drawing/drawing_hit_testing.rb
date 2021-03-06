module DrawingHitTesting
	HIT_TEST_INCREMENT = 1		# always 1, except for testing visually

	# Enable and initialize hit-testing mode, which 
	def with_hit_testing
		$engine.with_env(:hit_test, true) {
			$hit_test_id = 0
			$hit_test_options = {}

			with_offscreen_buffer(:small) { |buffer|
				buffer.using {
					with_env(:output_height, buffer.height) {		# hit testing code needs to know how big the output buffer is
						with_env(:output_width, buffer.width) {
							yield
						}
					}
				}
			}
		}
	end

	def next_hit_test_id
		$hit_test_id += HIT_TEST_INCREMENT
		return $hit_test_id
	end

	def with_unique_hit_test_color_for_object(object, user_data_integer=0)
		hit_test_id = next_hit_test_id
		$hit_test_options[[hit_test_id, user_data_integer]] = object
		saved = GL.GetColorArray
		GL.Color4ub(hit_test_id, user_data_integer, 0, 255)
		yield
		GL.Color(*saved)
	end

	# returns [hit_test_id, handle_id] or [0, nil]
	def hit_test_object_at_luz_coordinates(x, y)		# coordinates with 0-centered unit square
		x_index, y_index = (x + 0.5) * ($env[:output_width]-1), ((y + 0.5)) * ($env[:output_height]-1)
		hit_test_object_at(x_index, y_index)
	end

	def hit_test_object_at(x, y)		# pixel coordinates
		color = glReadPixels(x, y, 1, 1, GL_RGB, GL_UNSIGNED_BYTE).unpack("CCC")
		object = $hit_test_options[[color[0], color[1]]]
		return [object, color[1]]
	end
end
