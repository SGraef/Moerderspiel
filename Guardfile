# A sample Guardfile
# More info at https://github.com/guard/guard#readme
#

group :frontend do

  
  # , :run_all => { :cli => "--no-profile -f Cucumber::Formatter::Fuubar features" }
  guard 'cucumber', :cli => "--no-profile --format 'pretty'" do
    watch(%r{^features/.+\.feature$})
    watch(%r{^features/support/.+$})          { 'features' }
    watch(%r{^features/step_definitions/(.+)_steps\.rb$}) { |m| Dir[File.join("**/#{m[1]}.feature")][0] || 'features' }
  end

end

group :backend do

  guard :bundler do
    watch 'Gemfile'
  end

  ['test', 'development'].each do |current_env|

    guard 'migrate', rails_env: current_env do
      watch(%r{^db/migrate/(\d+).+\.rb})
      watch('db/seeds.rb')
    end

    guard 'rspec' do
      watch('spec/spec_helper.rb')                        { "spec" }
      watch('app/controllers/application_controller.rb')  { "spec/controllers" }
      watch(%r{^spec/.+_spec\.rb$})
      watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
      watch(%r{^app/(.*)(\.erb|\.haml)$})                 { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
      watch(%r{^lib/(.+)\.rb$})                           { |m| "spec/lib/#{m[1]}_spec.rb" }
      watch(%r{^app/controllers/(.+)_(controller)\.rb$})  { |m| ["spec/routing/#{m[1]}_routing_spec.rb", "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", "spec/acceptance/#{m[1]}_spec.rb"] }
    end

  end

end

