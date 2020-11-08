# RemAhning - Horus Widget to display remaining mAh

I was in need of a simple widget that displays the remaining mAh of my battery pack.  
As there was no such thing out of the box i tinkered around with lua and ended up with this little script.

Currently only one layout and size it supported.

## Installation
You might need to manually add a _calculated_ sensor to get the used capacity. We well call it _used_ for now.  
![Sensor Screenshot](/screenshot_sensor.png?raw=true "Sensor Screenshot")

Next add the widget to your telemetry page.  
![Widget Screenshot](/screenshot_widget_add.png?raw=true "Widget Screenshot")  

## Settings
![Settings Screenshot](/screenshot_settings.png?raw=true "Settings Screenshot")

### Color
Font color

### Source
Sensor or similiar to read the consumed mAh from

### Alarm
Configure if, and what type of alarm you want.  
| Alarm | Behaviour |
| - | - |
| 0 | No Alarm |
| 1 | Vibrate |
| 2 | Vibrate and beep|
| 3 | Beep |

### Reserve
Define some mAh capacity to reserve. Alarm will then be triggered not at 0mAh, but at the configured value.

### Capacity
How much juice you want to drain from the pack.

## Thanks to
Thanks to [Björn Pasteuning / Hobby4life](https://hobby4life.nl/) and his 
[Horus Battery Percentage Widget](https://github.com/Hobby4life/Horus-Battery-Percentage-Widget) from which i gained most of my knowledge.