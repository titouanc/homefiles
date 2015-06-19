-- cpu_percent() -> f() -> cpu usage %
function cpu_percent()
  local last_busy, last_idle = 0, 0

  local res = function ()
    for line in io.lines("/proc/stat") do
      local user, nice, system, idle, iowait, irq, softirq = string.match(line, "cpu +(%d+) +(%d+) +(%d+) +(%d+) +(%d+) +(%d+) +(%d+)")
      if user then
        local busy = user + nice + system + iowait + irq + softirq
        local dbusy = busy - last_busy
        local didle = idle - last_idle
        last_busy = busy
        last_idle = idle
        return math.floor(0.5 + 100 * dbusy / (dbusy + didle))
      end
    end
  end

  res()
  return res
end

-- cpu_percent() -> f() -> "load1 load5 load15"
function load_avg()
  for line in io.lines("/proc/loadavg") do
    local match = string.match(line, "(%d+.%d+ +%d+.%d+ +%d+.%d+)")
    if match then
      return match
    end
  end
end
