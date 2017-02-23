# encoding: utf-8
require_relative '../spec_helper'
require "logstash/codecs/multi_eof"
require 'pp'

describe LogStash::Codecs::MultiEof do
    context "Test function" do
      it "should check if a function works" do
        subject = LogStash::Codecs::MultiEof.new({})
        result = subject.test
        expect(result).to eq "I need scissors. 61!"
      end
    end
end

describe LogStash::Codecs::MultiEof do
    context "Check config" do
      it "should check the default config settings" do
        subject = LogStash::Codecs::MultiEof.new({})
        expect(subject.pattern).to eq "/.*./gm"
        expect(subject.what).to eq "previous"
        expect(subject.negate).to eq true
      end
    end
end

# describe LogStash::Codecs::MultiEof do
#   context "Default message test" do
#     subject { LogStash::Codecs::MultiEof.new({}) }
#
#     it "should generate an 'ok' message" do
#       expect(subject.get("message")).to eq('ok')
#     end # it "should generate an 'ok' message"
#   end # context "Default message test"

# describe ".register" do
#   pp 'Hot'
#    context "given an empty string" do
#      it "returns zero" do
#        expect(LogStash::Inputs::MultiEof.register())
#       # @logger.debug(LogStash::Inputs::MultiEof);
#      end
#    end
#  end
