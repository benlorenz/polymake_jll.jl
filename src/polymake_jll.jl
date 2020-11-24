# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule polymake_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("polymake")
JLLWrappers.@generate_main_file("polymake", UUID("7c209550-9012-526c-9264-55ba7a78ba2c"))
end  # module polymake_jll
