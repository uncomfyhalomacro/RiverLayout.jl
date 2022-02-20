module RiverLayout

export generate

using Wayland_jll
using Wayland_protocols_jll

function generate()
  project_root = rstrip(normpath(joinpath(Base.current_project()), "../"), '/')

  Wayland_jll.wayland_scanner() do exe
    @info "Generating private code"
    run(`$exe private-code "$project_root/protocols/river-layout-v3.xml" "$project_root/src/wayland/river-layout-v3-protocol.c"`)
  end

  Wayland_jll.wayland_scanner() do exe
    @info "Generating client header"
    run(`$exe client-header "$project_root/protocols/river-layout-v3.xml" "$project_root/src/wayland/river-layout-v3-protocol.h"`)
  end
end
end
