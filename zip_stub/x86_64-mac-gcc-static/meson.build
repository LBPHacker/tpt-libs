project('tpt-libs-prebuilt-mac64-static', ['c', 'cpp'])

cpp_compiler = meson.get_compiler('cpp')
uopt_lua = get_option('lua')
uopt_ssl = get_option('ssl')

lib_inv = {
	'zlib'    : [ 'libz'       , [] ],
	'sdl2'    : [ 'libSDL2'    , [ dependency('Cocoa'), dependency('IOKit'), dependency('CoreVideo'), dependency('Carbon'), dependency('Metal') ] ],
	'fftw'    : [ 'libfftw3f'  , [] ],
	'libcurl' : [ 'libcurl'    , [ dependency('Security') ] ],
	'lua52'   : [ 'liblua5.2'  , [] ],
	'lua51'   : [ 'liblua5.1'  , [] ],
	'luajit'  : [ 'libluajit'  , [] ],
}

incdirs = [ include_directories('include') ]
if uopt_lua == 'luajit'
	incdirs += include_directories('include/luajit-2.1')
elif uopt_lua == 'lua5.2'
	incdirs += include_directories('include/lua5.2')
elif uopt_lua == 'lua5.1'
	incdirs += include_directories('include/lua5.1')
else
	lua_opt_dep = []
endif

foreach name, inv : lib_inv
	library = cpp_compiler.find_library(inv[0], dirs: join_paths(meson.current_source_dir(), 'lib'))
	dependencies_of_library = []
	foreach depname : inv[1]
		dependencies_of_library += depname
	endforeach
	set_variable(name + '_dep', declare_dependency(
		include_directories: incdirs,
		dependencies: [ library, dependencies_of_library ]
	))
endforeach
