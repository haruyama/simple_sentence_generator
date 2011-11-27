#!/usr/bin/env ruby
# -*- encoding: utf-8 -*-

require 'yaml'

require 'segment'
require 'dictionary'

SEGMENTS = YAML.load(ARGF.read)

segment = SEGMENTS.values.sample

sentence = ''

s = segment

while !s.is_eos
  sentence += s.word
  s= s.get_post_segment
end

s = segment.get_pre_segment

while !s.is_bos
  sentence = s.word + sentence
  s= s.get_pre_segment
end

p sentence
