#!/usr/bin/env ruby
# -*- encoding: utf-8 -*-

require 'tiny_segmenter'
require 'yaml'

require 'segment'

class Dictionay

  def initialize
    @segments = {}
    @segments[BOS_WORD] = BOS.new
    @segments[EOS_WORD] = EOS.new
  end

  def add_dic(sentence)
    words = TinySegmenter.segment(sentence)
    words.unshift(BOS_WORD)
    words << EOS_WORD

    pre = nil
    cur = get_segment(BOS_WORD)

    (0 ... words.size - 1).each { |i|
      post = get_segment(words[i + 1])

      cur.add_pre_segment(pre)
      cur.add_post_segment(post)

      pre = cur
      cur = post
    }
    cur.add_pre_segment(pre)

  end


  def get_segment(word)
    return @segments[word] if @segments.key?(word)
    segment = Segment.new(word)
    @segments[word] = segment
    segment
  end

  def make_dictionay(sentences)
    sentences.each { |s|
      add_dic(s.chomp)
    }
    @segments
  end
end
