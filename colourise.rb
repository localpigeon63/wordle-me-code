def colourise(string, colour_code)
    "\e[#{colour_code}m#{string}\e[0m"
end

def red(string)
  colourise(string, 31)
end

def green(string)
  colourise(string, 32)
end

def yellow(string)
  colourise(string, 33)
end