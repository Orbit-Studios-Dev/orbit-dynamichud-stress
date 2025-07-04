# orbit-dynamichud-stress
 A stress addon for Orbit Studios Dynamic Hud (qbx_hud stress system)

## Disclaimer
This stress system is only slightly adjusted to suit my HUD but I take no credit for it. All the credit goes to the great people at QBX.
This stress system is taken, adjusted and isolated from qbx_hud.
I generally use qbx and like the stress system, therefore I've decided to use this particular stress system.

[QBOX PROJECT](https://github.com/Qbox-project) 
[qbx_hud](https://github.com/Qbox-project/qbx_hud)

## Requirements
- ox_lib
- orbit-lib (For Job Check)
- orbit-dynamichud (Tailored for this hud)

This resource is provided as it is and no support is provided.

## Data Handling & Manipulation
### Getting Stress
```lua
local stress = LocalPlayer.state.stress or 0
```
### Setting Stress (State handling)
```lua
local src = source
local value = stressLevel
Player(src)?.state:set("stress", value, true)
```
