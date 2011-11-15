file "resources/resources.rb" => ['resources/icons.qrc'] do 
  sh "rbrcc resources/icons.qrc -o resources/resources.rb"
end


rule(/\_ui\.rb$/ => [
      proc {|tn| tn.sub(/\_ui\.rb$/, '.ui')}
]) do |t|
  sh "(echo '# encoding: utf-8' && rbuic4  -tr my_translate #{t.source}) > #{t.name}"
end

SRC = FileList['ui/ui_files/*.ui']
DST = SRC.sub('.ui', '_ui.rb')

#task :default => ["resources/resources.rb"] + DST
task :default => DST

task :run => [:default] do
  sh "ruby main.rb"
end

task :console  do
  sh "pry -r ./console"
end

task :test_report do
  sh "ruby reports/test.rb"
end
