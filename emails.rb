#!/usr/bin/env ruby

def choose_five
  process_emails.sample(5) # random items
end

def process_emails
  masked_emails = []

  File.read(ARGV.first).split.each do |email|
    first, second = email.split('@')
    new_email = masked(first) + '@' + second
    masked_emails << new_email
  end

  masked_emails.shuffle # randomization
end

def masked(part)
  if part.length >= 4
    part[0..3].chars.concat(part[3..-1].chars.map{|c| '*'}).join
  else
    part.chars.map{|c| '*'}.join
  end
end

puts choose_five
