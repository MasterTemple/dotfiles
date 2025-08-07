process_name="foot-overlay"
if pgrep $process_name; then
  kill $(pgrep $process_name)
  echo "Process 'process_name' terminated."
else
  echo "Process 'process_name' not found."
fi
foot -T "foot-overlay" -- sh -c "echo '$1'; read"
