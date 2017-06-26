#if(MSVC)
#	MESSAGE(STATUS "CMAKE_C_FLAGS_DEBUG_INIT:${CMAKE_C_FLAGS_DEBUG_INIT}")
#    set(CMAKE_C_FLAGS_DEBUG_INIT "/D_DEBUG /MTd /Zi /Ob0 /Od /RTC1")
#    set(CMAKE_C_FLAGS_MINSIZEREL_INIT     "/MT /O1 /Ob1 /D NDEBUG")
#    set(CMAKE_C_FLAGS_RELEASE_INIT        "/MT /O2 /Ob2 /D NDEBUG")
#    set(CMAKE_C_FLAGS_RELWITHDEBINFO_INIT "/MT /Zi /O2 /Ob1 /D NDEBUG")
#    set(CMAKE_CXX_FLAGS_DEBUG_INIT "/D_DEBUG /MTd /Zi /Ob0 /Od /RTC1")
#    set(CMAKE_CXX_FLAGS_MINSIZEREL_INIT     "/MT /O1 /Ob1 /D NDEBUG")
#    set(CMAKE_CXX_FLAGS_RELEASE_INIT        "/MT /O2 /Ob2 /D NDEBUG")
#    set(CMAKE_CXX_FLAGS_RELWITHDEBINFO_INIT "/MT /Zi /O2 /Ob1 /D NDEBUG")
#    MESSAGE(STATUS "link to static  C and C++ runtime lirbary(/MT /MTd)")
#endif()

if(MSVC)     
  # Use the static C library for all build types
  MESSAGE(STATUS "link to static  C and C++ runtime lirbary(/MT /MTd)")
  foreach(var 
		CMAKE_C_FLAGS_DEBUG_INIT 
		CMAKE_C_FLAGS_RELEASE_INIT
		CMAKE_C_FLAGS_MINSIZEREL_INIT 
		CMAKE_C_FLAGS_RELWITHDEBINFO_INIT
		CMAKE_CXX_FLAGS_DEBUG_INIT 
		CMAKE_CXX_FLAGS_RELEASE_INIT
		CMAKE_CXX_FLAGS_MINSIZEREL_INIT 
		CMAKE_CXX_FLAGS_RELWITHDEBINFO_INIT
    )
    if(${var} MATCHES "/MD")
      string(REGEX REPLACE "/MD" "/MT" ${var} "${${var}}")
      MESSAGE(STATUS  "${var}:${${var}}")
    endif()    
  endforeach()	  
endif(MSVC)
