require 'socket'
require 'fileutils'

# ソケットの作成
socket_path = '/tmp/my_socket'
server = UNIXServer.new(socket_path)

# 子プロセスを生成
child_pid = fork do
  client = server.accept
  data = client.read
  puts "Child process received data: #{data}"
  client.close# ソケットを削除する
  exit
end

client = UNIXSocket.new(socket_path)
client.write("Hello, socket!")
client.close

Process.wait(child_pid)

server.close
FileUtils.rm(socket_path) if File.exist?(socket_path)
