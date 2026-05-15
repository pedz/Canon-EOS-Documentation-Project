#!/usr/bin/ruby

# True until we see a repeat indention level
$discoverPhase = true

# Converts the amount of indentation to a level
$indentToLevel = []

# contains the maximum text length of each level
$levelToTextLength = []

# Keeps track of the current level during $discoverPhase
$currentLevel = 0

# Level to current text
$levelToText = []

# Array of arrays containing all the entire table
$table = []

def add_row
  a = []
  (0 ... $currentLevel).each do |level|
    a.push $levelToText[level]
  end
  $table.push a
end

def dump_table
  $table.each do |row|
    output = ""
    row.each_with_index do |item, level|
      output += "| #{"%*s" % [ -$levelToTextLength[level], item ] } "
    end
    puts "#{output}|"
  end
end

$<.each_line do |line|
  line.chomp
  next unless line.match(/^( +)\* (.*)/)

  indent = $1.length
  text = $2
  if $indentToLevel[indent] && $discoverPhase
    $discoverPhase = false
    add_row
  end
  if $discoverPhase
    $indentToLevel[indent] = $currentLevel
    $levelToTextLength[$currentLevel] = 0
    $currentLevel += 1
  end
  level = $indentToLevel[indent]
  $levelToTextLength[level] = text.length if $levelToTextLength[level] < text.length
  $levelToText[level] = text
  add_row if level == ($currentLevel - 1) && !$discoverPhase
end

dump_table
