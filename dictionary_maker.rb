#!/usr/bin/env ruby
# -*- encoding: utf-8 -*-

require 'yaml'

require 'segment'
require 'dictionary'

SEGMENTS = Dictionay.new.make_dictionay(ARGF.read.split(/\n/))
print SEGMENTS.to_yaml


#p SEGMENTS['僕'].word


