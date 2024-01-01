# LEDtest.py by D. J. Norris  Jan, 2017
# Uses Prolog with Python type functions
import time
import RPi.GPIO as GPIO
from pyswip import Functor, Variable, Query, call

# Setup GPIO pins
GPIO.setmode(GPIO.BCM)
GPIO.setup(4, GPIO.output)
GPIO.setup(17, GPIO.output)

# Setup Python like functions for Prolog statements
assertz = Functor("assertz", 1)
father = Functor("father", 2)

# Add facts to a dynamic database
call(assertz(father("michael","john")))
call(assertz(father("michael", "gina")))

# Setup an iterative query session
X = Variable()
q = Query(father("michael",X))
while q.nextSolution():
    print "Hello, ", X.value
    if str(X.value) == "john": # LED #4 on if john is michael's
    child
        GPIO.output(4,GPIO.HIGH)
        time.sleep(5)
        GPIO.output(4,GPIO.LOW)
    if str(X.value) == "gina": # LED #17 on if gina is
    michael's child
        GPIO.output(17,GPIO.HIGH)
        time.sleep(5)
        GPIO.output(17,GPIO.LOW)