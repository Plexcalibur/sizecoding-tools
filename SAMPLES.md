# Initial memory state hashes

### Setup

- `hashmem.com` version 1.0 (built on 17.2.2024)
- started directly via `dosbox -c hashmem.com`

<table>
<tr>
<th colspan=2>
Comparision of two sample memory hash dumps Dosbox vs Dosbox-staging
</th>
</tr>
<tr>
<td colspan=2>
Differences on staging:
<ul>
<li>Most memory patches that are NOT filled with zeros are different</li>
<li>Grafics mode memory (A000 to AFFF) is filled with 0xFF instead of 0x00</li>
<li>Memory before Textmode memory (B000 to B7FF) is filled with 0xFF instead of 0x00</li>
</ul>
</td>
</tr>
<tr>
<td valign=top>dosbox/jammy, now 0.74-3-4 amd64 (Ubuntu 22.04 LTS)
<pre>
Version1.3
AX:0000 BX:0000 CX:00FF DX:0192 SI:0100 DI:FFFE BP:091C SP:FFD8 
CS:0192 DS:0192 ES:0192

(1 char = 1kb)
0192 \_000_100_200_300_400_500_600_700_800_900_A00_B00_C00_D00_E00_F00 last4Byte
0000 l7d.UQuv:...:...:...:...:...:...:...:...:...:...:...:...:...:... 00000000
1000 :...:.s.:...:...:...:...:...:...:...:...:...:...:...:...:...:... 00000000
2000 :...:...:...:...:...:...:...:...:...:...:...:...:...:...:...:... 00000000
3000 :...:...:...:...:...:...:...:...:...:...:...:...:...:...:...:... 00000000
4000 :...:...:...:...:...:...:...:...:...:...:...:...:...:...:...:... 00000000
5000 :...:...:...:...:...:...:...:...:...:...:...:...:...:...:...:... 00000000
6000 :...:...:...:...:...:...:...:...:...:...:...:...:...:...:...:... 00000000
7000 :...:...:...:...:...:...:...:...:...:...:...:...:...:...:...:... 00000000
8000 :...:...:...:...:...:...:...:...:...:...:...:...:...:...:...:... 00000000
9000 :...:...:...:...:...:...:...:...:...:...:...:...:...:...:...:..G 20202020
A000 :...:...:...:...:...:...:...:...:...:...:...:...:...:...:...:... 00000000
B000 :...:...:...:...:...:...:...:...r4V3pppppppppppppppppppppppppppp 20072007
C000 7Jkf72un43T7:...:...:...:...:..fODB.:...:...:...:...:...:...:... 00000000
D000 q...:...:...:...:...:...:...:...:...:...:...:...:...:...:...:... 00000000
E000 :...:...:...:...:...:...:...:...:...:...:...:...:...:...:...:... 00000000
F000 :...1O..Mb..:...:...:...:...:...:...:...:...:...:...:...X.8.O.kM 3200FC55

Details: (1 char = 64b)
0000 OAKQe833:...:...jM8.:...:...O...vBu8:...HwJ.Y...:...:...:...:... 00000000
0100 :.K.:vCcmasv:...:...:...:..MOg..:OOS8r6.b8nrgHu9Rj3HU...:...:... 00000000
1100 :...:...:...:...:...:...:...:...:.oN6...:...:...:...:...:...:... 00000000
9F00 :...:...:...:...:...:...:...:...:...:...:...:...:...:...:...:..G 20202020
B800 xc5ZCkqrofgQWqC1l7mCwBPqC7qfvC8cv2222tO2Q9222q2222W2222222222222 20072007
B900 2222222222222222222222222222222222222222222222222222222222222222 20072007
BA00 2222222222222222222222222222222222222222222222222222222222222222 20072007
BB00 2222222222222222222222222222222222222222222222222222222222222222 20072007
BC00 2222222222222222222222222222222222222222222222222222222222222222 20072007
BD00 2222222222222222222222222222222222222222222222222222222222222222 20072007
BE00 2222222222222222222222222222222222222222222222222222222222222222 20072007
BF00 2222222222222222222222222222222222222222222222222222222222222222 20072007
C000 4h..HHw9vZPX6LpJRKhef5MRSL6eXocRvt4XXBlShNBrw8Fe9OlQJ3bXWllPHMf1 00000000
C100 mFtbAfOfvmV1nBgTYStH7OW8LRDXQscsaxwwnHJsoM9yLOr2x4QH7DhRwDuA2RgU 00000000
C200 g1sfkQvxAXZvDavgKqj82wZOrIROX...owUTN...:DZT:qoO:..lhv7MUsqTO... 00000000
C700 :...:...:...:...:...:...:...:...:...:...:...:...:...:...:...:..f 00000028
C800 F...:.COfF44fEy.6...:...:...:...:...:...V5..c...:...:...:...:... 00000000
D000 v...:...:...:...:...:...:...:...:...:...:...:...:...:...:...:... 00000000
F100 V4aopsQYfdIev...CYKH5sxLPli.:...:...:...:...:...:...:...:...:... 00000000
F200 NGTBmdXBPTNnFG5GGAbn8diX:...:...:...:...:...:...:...:...:...:... 00000000
FE00 qs..:...:...:...:...:...:...:...:...:.g.:...:...:...:...:...:... 00000000
FF00 :.TS:...:...:...:...:...:...:...:...:...:tLsRG4csZUwAVqWJDw.:H.D 3200FC55

</pre>
</td>
<td valign=top>dosbox-staging version 0.81.0 (Ubuntu 22.04 LTS)
<pre>
Version1.3
AX:0000 BX:0000 CX:00FF DX:0193 SI:0100 DI:FFFE BP:091C SP:FFD8 
CS:0193 DS:0193 ES:0193

(1 char = 1kb)
0193 \_000_100_200_300_400_500_600_700_800_900_A00_B00_C00_D00_E00_F00 last4Byte
0000 XCT.3Qz3:...:...:...:...:...:...:...:...:...:...:...:...:...:... 00000000
1000 :...:.O.:...:...:...:...:...:...:...:...:...:...:...:...:...:... 00000000
2000 :...:...:...:...:...:...:...:...:...:...:...:...:...:...:...:... 00000000
3000 :...:...:...:...:...:...:...:...:...:...:...:...:...:...:...:... 00000000
4000 :...:...:...:...:...:...:...:...:...:...:...:...:...:...:...:... 00000000
5000 :...:...:...:...:...:...:...:...:...:...:...:...:...:...:...:... 00000000
6000 :...:...:...:...:...:...:...:...:...:...:...:...:...:...:...:... 00000000
7000 :...:...:...:...:...:...:...:...:...:...:...:...:...:...:...:... 00000000
8000 :...:...:...:...:...:...:...:...:...:...:...:...:...:...:...:... 00000000
9000 :...:...:...:...:...:...:...:...:...:...:...:...:...:...:...:..G 20202020
A000 JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ FFFFFFFF
B000 JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ3xPppppppppppppppppppppppppppppp 20072007
C000 AuQ1x9qq5tbbm...:...:...:...:..B1uxF:...:...:...:...:...:...:... 00000000
D000 q...:...:...:...:...:...:...:...:...:...:...:...:...:...:...:... 00000000
E000 :...:...:...:...:...:...:...:...:...:...:...:...:...:...:...:... 00000000
F000 :...il..Mb..:...:...:...:...:...:...:...:...:...:...:...u.C.O.ks 3200FC55

Details: (1 char = 64b)
0000 GAX5S8uu:...:...bsC.:...:...:..1v4u8:...HwJ.b...:...:...:...:... 00000000
0100 :.K.:vecp.So:...:...:...:..MOg..:9EFI6r.ziKjWMrFk3Ibf...:...:... 00000000
1100 :...:...:...:...:...:...:...:...:.JDk...:...:...:...:...:...:... 00000000
9F00 :...:...:...:...:...:...:...:...:...:...:...:...:...:...:...:..G 20202020
A000 rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr FFFFFFFF
A100 rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr FFFFFFFF
A200 rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr FFFFFFFF
A300 rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr FFFFFFFF
A400 rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr FFFFFFFF
A500 rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr FFFFFFFF
A600 rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr FFFFFFFF
A700 rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr FFFFFFFF
A800 rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr FFFFFFFF
A900 rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr FFFFFFFF
AA00 rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr FFFFFFFF
AB00 rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr FFFFFFFF
AC00 rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr FFFFFFFF
AD00 rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr FFFFFFFF
AE00 rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr FFFFFFFF
AF00 rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr FFFFFFFF
B000 rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr FFFFFFFF
B100 rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr FFFFFFFF
B200 rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr FFFFFFFF
B300 rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr FFFFFFFF
B400 rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr FFFFFFFF
B500 rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr FFFFFFFF
B600 rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr FFFFFFFF
B700 rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr FFFFFFFF
B800 xc5V7kqrofgQWqC1e7XCwBPqCMitcd22tO21mu22F22222222222222222222222 20072007
B900 2222222222222222222222222222222222222222222222222222222222222222 20072007
BA00 2222222222222222222222222222222222222222222222222222222222222222 20072007
BB00 2222222222222222222222222222222222222222222222222222222222222222 20072007
BC00 2222222222222222222222222222222222222222222222222222222222222222 20072007
BD00 2222222222222222222222222222222222222222222222222222222222222222 20072007
BE00 2222222222222222222222222222222222222222222222222222222222222222 20072007
BF00 2222222222222222222222222222222222222222222222222222222222222222 20072007
C000 sh..kVtkKShGPBSwEhIPn211TmS7ps3w14jnFxRKrGET4YdeKWJO9AQPVbopuokH 0000DC66
C100 GCfLtiWSVsDwE8WEmBeAw73CJ3gcABt7BQs3wCjl2MxAbldhl7zMD8HVXhDNiUm5 D6C60000
C200 3lc1YO9XBHNIwaa7xyUtX9ZCHjRuHqFh19qASPEqoX..:nFq6V..:.aBf.3Bc... 00000000
C300 eJAl25hgp...:...:...:...:...:...:...:...:...:...:...:...:...:... 00000000
C700 :...:...:...:...:...:...:...:...:...:...:...:...:...:...:...:..B 00000084
C800 Y...:.rFOA5VY6sy2pd.n...:...:...:...:...:...PZ..c...6...:...:... 00000000
D000 v...:...:...:...:...:...:...:...:...:...:...:...:...:...:...:... 00000000
F100 V48BpRQYfdIey..q:wKv5cDP7z..:...:...:...:...:...:...:...:...:... 00000000
F200 NGTBmdXBPTNnFG5GGAbn8diX:...:...:...:...:...:...:...:...:...:... 00000000
FE00 qk..:...:...:...:...:...:...:...:...:.D.:...:...:...:...:...:... 00000000
FF00 :.TS:...:...:...:...:...:...:...:...:...:tLsRG4csZUwAVqWJDz.:5.C 3200FC55

</pre>
</td>
</tr>
</table>
