# Autogenerated wrapper script for polymake_jll for i686-linux-gnu-cxx03
export libpolymake, polymake, polymake_config

using Perl_jll
using GMP_jll
using MPFR_jll
using boost_jll
using CompilerSupportLibraries_jll
using lrslib_jll
using PPL_jll
using cddlib_jll
using bliss_jll
using FLINT_jll
using normaliz_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"
LIBPATH_default = ""

# Relative path to `libpolymake`
const libpolymake_splitpath = ["lib", "libpolymake.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libpolymake_path = ""

# libpolymake-specific global declaration
# This will be filled out by __init__()
libpolymake_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libpolymake = "libpolymake.so.4.1"


# Relative path to `polymake`
const polymake_splitpath = ["bin", "polymake"]

# This will be filled out by __init__() for all products, as it must be done at runtime
polymake_path = ""

# polymake-specific global declaration
function polymake(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        LIBPATH_base = get(ENV, LIBPATH_env, expanduser(LIBPATH_default))
        if !isempty(LIBPATH_base)
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', LIBPATH_base)
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(polymake_path)
    end
end


# Relative path to `polymake_config`
const polymake_config_splitpath = ["bin", "polymake-config"]

# This will be filled out by __init__() for all products, as it must be done at runtime
polymake_config_path = ""

# polymake_config-specific global declaration
function polymake_config(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        LIBPATH_base = get(ENV, LIBPATH_env, expanduser(LIBPATH_default))
        if !isempty(LIBPATH_base)
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', LIBPATH_base)
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(polymake_config_path)
    end
end


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"polymake")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (Perl_jll.PATH_list, GMP_jll.PATH_list, MPFR_jll.PATH_list, boost_jll.PATH_list, CompilerSupportLibraries_jll.PATH_list, lrslib_jll.PATH_list, PPL_jll.PATH_list, cddlib_jll.PATH_list, bliss_jll.PATH_list, FLINT_jll.PATH_list, normaliz_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (Perl_jll.LIBPATH_list, GMP_jll.LIBPATH_list, MPFR_jll.LIBPATH_list, boost_jll.LIBPATH_list, CompilerSupportLibraries_jll.LIBPATH_list, lrslib_jll.LIBPATH_list, PPL_jll.LIBPATH_list, cddlib_jll.LIBPATH_list, bliss_jll.LIBPATH_list, FLINT_jll.LIBPATH_list, normaliz_jll.LIBPATH_list,))

    global libpolymake_path = normpath(joinpath(artifact_dir, libpolymake_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libpolymake_handle = dlopen(libpolymake_path)
    push!(LIBPATH_list, dirname(libpolymake_path))

    global polymake_path = normpath(joinpath(artifact_dir, polymake_splitpath...))

    push!(PATH_list, dirname(polymake_path))
    global polymake_config_path = normpath(joinpath(artifact_dir, polymake_config_splitpath...))

    push!(PATH_list, dirname(polymake_config_path))
    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(vcat(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)]), ':')
end  # __init__()

