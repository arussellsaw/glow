# glow

A very quick and easy status bar indicator for atom

i currently use it to indicate output/run status of go-plus builds

i would like to add config for event emitters associating events with colours.

to consume:
```
"consumedServices": {
  "glow": {
    "versions": {
      "^1.0.0": "consumeGlow"
    }
  }
},
```
```
glow.red()
glow.green()
glow.blue()
glow.color('#c817fc')
```

![Glow in my status bar](https://i.imgur.com/dkLIOlT.png)
