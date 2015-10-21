JSON files for traditional Rock Paper Scissors as well as David C. Lovelace's [various RPS variants][rps_variants].

Currently, the only data file pairs each item with the things it can defeat. Anything that is not in that list defeats the item in question. If I can find an efficient way to generate them, I may also create a file that pairs items only with what defeats them and/or a file that tracks both the items that an item defeats and is defeated by. In the current format, rock from RPS-7 would look like this:

```json
{
	"rock":{"fire":"pounds out", "scissors":"crushes","sponge":"crushes"},
}
```

For cases where a later variant reverses an earlier outcome (e.g., RPS-101 changed `Wolf-2 launches nuke` to `Nuke incinerates Wolf`), I have used the RPS-101 ruling. I may come up with a better way to store this later, I'm thinking something like this ():

```json
{
	"nuke25":{},
	"nuke101":{"wolf":"incinerates"}
	"nuke":{"wolf":"incinerates"}
	"wolf25":{"nuke":"-2 launches"},
	"wolf101":{""},
	"wolf":{""},
}

```

Then checks can be made against the specific versions if necessary, but otherwise things default to RPS-101 Rules. 

[rps_variants]:http://www.umop.com/rps.htm
