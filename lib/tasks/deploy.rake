desc "deploys to heroku after packaging & cleaning up assets"
task deploy: [:environment, 'assets:precompile'] do
	assetPath = "../#{Rails.application.class.to_s.split("::").first.downcase}-assets"
	puts `rm -r #{assetPath}`
	puts `mkdir -p #{assetPath}`
	puts `cp -r public/* #{assetPath}`
	puts `rake assets:clean`
	puts `mkdir public`
	puts `cp #{assetPath}/manifest.yml public/`
	puts `git add .`
	puts `git commit -m "pushing to heroku"`
	puts `git push heroku master`
end
