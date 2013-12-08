module ProjectsHelper
  def project_path
    root_path + params[:secret]
  end
end
