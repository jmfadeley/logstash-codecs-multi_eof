# encoding: utf-8
require "logstash/codecs/base"
require "logstash/codecs/line"
require "logstash/namespace"

# This  codec will append a string to the message field
# of an event, either in the decoding or encoding methods
#
# This is only intended to be used as an example.
#
# input {
#   stdin { codec =>  }
# }
#
# or
#
# output {
#   stdout { codec =>  }
# }
#
class LogStash::Codecs::MultiEof < LogStash::Codecs::Base

  # The codec name
  config_name "multi_eof"

  # Append a string to the message
  config :append, :validate => :string, :default => ', Hello World!'
  config :pattern, :validate => :string, :required => true, :default => "/.*./gm"
  config :what, :validate => ["previous", "next"], :required => true, :default => "previous"
  config :negate, :validate => :boolean, :default => true

  def test
    "I need scissors. 61!"
  end

  def register
    @lines = LogStash::Codecs::Line.new
    @lines.charset = "UTF-8"
  end # def register

  def decode(data)
    @lines.decode(data) do |line|
      replace = { "message" => line.get("message").to_s + @append }
      yield LogStash::Event.new(replace)
    end
  end # def decode

  # Encode a single event, this returns the raw data to be returned as a String
  def encode_sync(event)
    event.get("message").to_s + @append + NL
  end # def encode_sync

end # class LogStash::Codecs::MultiEof
