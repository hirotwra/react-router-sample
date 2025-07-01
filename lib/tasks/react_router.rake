namespace :react_router do
  desc "Build React Router App"
  task build: :environment do |_, args|
    Dir.chdir(Rails.root.join("frontend")) do
      system("pnpm", "run", "build", exception: true)

      # Copy the react-router build to the Rails public directory
      FileUtils.cp_r("build", Rails.root.join("public", "react-router"))
    end
  end

  task clobber: :environment do
    FileUtils.rm_rf(Rails.root.join("public", "react-router"))
  end
end

Rake::Task["assets:precompile"].enhance([ "react_router:build" ])
Rake::Task["assets:clobber"].enhance([ "react_router:clobber" ])
