
require 'json'

json = ARGV[0]

# command example
# docker run tac0x2a/witchcoder-judge:v1 echo '{ "language":"RB", "code":"puts gets.split(\" \").map{|i| i.to_i}.sum", "input":"2 3" }' | ruby run.rb

args = JSON.parse(json).to_h

# Export to File
code = args["code"]

file_ext, command_template = case args["language"]
                     when 'RB'
                      ["rb", "ruby %s"]
                     end

file_name = "code." + file_ext
File.open(file_name, "w") do |fp|
  fp.puts(code)
end

# Execute
input = args["input"]
command = command_template % [file_name]

output = ""
require 'benchmark'
exec_time = Benchmark.realtime do
  output = `echo '#{input}' | #{command}`
end
exec_time_ms = (exec_time * 1000).to_i

result = "Success"

# OutputJudge
puts({result: result, output: output, exec_time: exec_time_ms}.to_json)
