echo "[INFO] -> Running actions for branch $SERVICE..."

# Get dependencies, fail shell on bad exit
npm i
failOnBadExit $?

# Run tests and tee output to report, fail shell on bad exit
echo "[WARN] -> No test functions for this branch!"
failOnBadExit $?

# All done!
echo "[INFO] -> Finished!"
