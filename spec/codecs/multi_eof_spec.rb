# encoding: utf-8
require_relative '../spec_helper'
require "logstash/codecs/multi_eof"
require 'pp'

describe LogStash::Codecs::MultiEof do

  # it_behaves_like "an interruptible input plugin" do
  #   let(:config) { { "interval" => 100 } }
  # end

  context "Default message test" do
    subject { LogStash::Codecs::MultiEof.new({}) }

    it "should generate an 'ok' message" do
      expect(subject.get("message")).to eq('ok')
    end # it "should generate an 'ok' message"
  end # context "Default message test"

  # describe ".register" do
  #   pp 'Hot'
  #    context "given an empty string" do
  #      it "returns zero" do
  #        expect(LogStash::Inputs::MultiEof.register())
  #       # @logger.debug(LogStash::Inputs::MultiEof);
  #      end
  #    end
  #  end


end
