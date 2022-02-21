function check_generate()
  @testset "Check if private and header code are successfully generated" begin
    generate()
    project_root = rstrip(normpath(joinpath(Base.current_project()), "../"), '/')
    private_code = "$project_root/src/wayland/river-layout-v3-protocol.c"
    header_code = "$project_root/src/wayland/river-layout-v3-protocol.h"
    @test isfile(private_code)
    @test isfile(header_code)
  end
end

check_generate()
