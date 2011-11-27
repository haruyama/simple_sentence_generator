#!/usr/bin/env ruby
# -*- encoding: utf-8 -*-

BOS_WORD = '[BOS]'
EOS_WORD = '[EOS]'


class Segment
  attr_reader :word
  attr_reader :pre
  attr_reader :post

  def initialize(word)
    @word = word
    @pre  = []
    @post = []
  end

  def is_bos
    false
  end

  def is_eos
    false
  end

  def add_pre_segment(segment)
    return if is_bos
    @pre << segment
  end

  def add_post_segment(segment)
    return if is_eos
    @post << segment
  end

  def get_pre_segment
    raise '@pre is empty' if @pre.empty?
    @pre.sample
  end

  def get_post_segment
    raise '@post is empty' if @post.empty?
    @post.sample
  end
end

class BOS < Segment

  def initialize
    super(BOS_WORD)
  end

  def is_bos
    true
  end
end

class EOS < Segment

  def initialize
    super(EOS_WORD)
  end

  def is_eos
    true
  end
end

