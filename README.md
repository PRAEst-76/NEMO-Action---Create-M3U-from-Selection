This is a bash script and Nemo action for creating m3u playlists based on common rom extensions which is required for playing many multi-disk games on emulation front-ends. ie  

```
Corporation (1990)(Core).m3u
  Corporation (1990)(Core)(Disk 1 of 2)(Intro)[cr SCX].zip
  Corporation (1990)(Core)(Disk 2 of 2)(Game)[cr SCX][bootable].zip
```

Script needs to go in your path and be executable. Action itself should go in ~/.local/share/nemo/actions/

Restart Nemo with

`nemo --quit`

It's not really of use for music m3us as it contains none of the meta syntax.

The script will add #SAVEDISK: to the end of every m3u which in supported platforms / frontends will create a savedisk automatically. In unsupported platforms this should be safely ignored.

I've set the list of supported extensions to those I feel usually need it, but if I've missed any let me know or open a PR.  

I made this for my own use, so make no guarantee that it won't cause your hard-drive to turn inside out and eat your cat. Though it is unlikely.
