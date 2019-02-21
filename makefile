###############################################################################
#                                                                             #
#	              makefile for Duke Nukem3D for Amiga WarpOS                 #
#                                                                             #
###############################################################################

NAME         = chocolate-duke3d

###############################################################################

WARN	=
DEF	= -DPLATFORM_UNIX -DWARPUP
DEBUG	=
OPT	= -w -specs=warpup -O2 -fno-strict-aliasing -fno-aggressive-loop-optimizations
CPU	= -mcpu=750

INCL	= -I Engine/src -I Game/src -I/gg/ppc-amigaos/newlib/include	\
          -I/gg/os-includeppc -I/gg/os-includeppc/SDL

CC	= gcc
CPP	= gcc -E
RM	= delete all quiet
MKDIR	= makedir

###############################################################################

LIBS 	= -lSDL_mixer -lSDL -lmikmod -lvorbisfile -lvorbis -logg -lFLAC -lmad

CFLAGS	= $(CPU) $(WARN) $(OPT) $(INCL) $(DEBUG) $(DEF) 

###############################################################################

ENGINE	= Engine/src/cache.o Engine/src/display.o	\
      Engine/src/draw.o Engine/src/dummy_multi.o	\
	  Engine/src/engine.o Engine/src/filesystem.o	\
	  Engine/src/fixedPoint_math.o Engine/src/mmulti.o	\
	  Engine/src/network.o Engine/src/tiles.o

GAME	= Game/src/actors.o Game/src/animlib.o	\
      Game/src/config.o Game/src/console.o	\
      Game/src/control.o Game/src/cvar_defs.o	\
	  Game/src/cvars.o Game/src/dummy_audiolib.o	\
	  Game/src/game.o Game/src/gamedef.o	\
	  Game/src/global.o Game/src/keyboard.o	\
	  Game/src/menues.o Game/src/player.o	\
	  Game/src/premap.o Game/src/rts.o	\
	  Game/src/scriplib.o	Game/src/sector.o	\
	  Game/src/sounds.o

AUDIO	= Game/src/audiolib/fx_man.o Game/src/audiolib/dsl.o	\
      Game/src/audiolib/ll_man.o Game/src/audiolib/multivoc.o	\
	  Game/src/audiolib/mv_mix.o Game/src/audiolib/mvreverb.o	\
	  Game/src/audiolib/nodpmi.o Game/src/audiolib/pitch.o	\
	  Game/src/audiolib/user.o Game/src/audiolib/usrhooks.o

MIDI	= Game/src/midi/sdl_midi.o

###############################################################################

all: $(NAME)

$(NAME):	$(ENGINE) $(GAME) $(AUDIO) $(MIDI)
		$(CC) $(CFLAGS) -o $@ $(ENGINE) $(GAME) $(AUDIO) $(MIDI) $(LIBS)

###############################################################################

clean:
	-$(RM) Engine/src/*.o
	-$(RM) Game/src/*.o
	-$(RM) Game/src/audiolib/*.o
	-$(RM) Game/src/midi/*.o
	-$(RM) $(NAME)

###############################################################################


Engine/src/cache.o:	Engine/src/cache.c
Engine/src/display.o:	Engine/src/display.c
Engine/src/draw.o:	Engine/src/draw.c
Engine/src/dummy_multi.o:	Engine/src/dummy_multi.c
Engine/src/engine.o:	Engine/src/engine.c
Engine/src/filesystem.o:	Engine/src/filesystem.c
Engine/src/fixedPoint_math.o:	Engine/src/fixedPoint_math.c
Engine/src/mmulti.o:	Engine/src/mmulti.c
Engine/src/network.o:	Engine/src/network.c
Engine/src/tiles.o:		Engine/src/tiles.c


Game/src/actors.o:		Game/src/actors.c
Game/src/animlib.o:		Game/src/animlib.c
Game/src/config.o:		Game/src/config.c
Game/src/console.o:		Game/src/console.c
Game/src/control.o:		Game/src/control.c
Game/src/cvar_defs.o:		Game/src/cvar_defs.c
Game/src/cvars.o:			Game/src/cvars.c
Game/src/dummy_audiolib.o:	Game/src/dummy_audiolib.c
Game/src/game.o:			Game/src/game.c
Game/src/gamedef.o:		Game/src/gamedef.c
Game/src/global.o:		Game/src/global.c
Game/src/keyboard.o:		Game/src/keyboard.c
Game/src/menues.o:		Game/src/menues.c
Game/src/player.o:		Game/src/player.c
Game/src/rts.o:			Game/src/rts.c
Game/src/scriplib.o:		Game/src/scriplib.c
Game/src/sector.o:		Game/src/sector.c
Game/src/sounds.o:		Game/src/sounds.c

Game/src/premap.o:		Game/src/premap.c
		$(CC) $(CFLAGS) -O0 -c -o $@ Game/src/premap.c

Game/src/audiolib/fx_man.o:		Game/src/audiolib/fx_man.c
Game/src/audiolib/dsl.o:		Game/src/audiolib/dsl.c
Game/src/audiolib/ll_man.o:		Game/src/audiolib/ll_man.c
Game/src/audiolib/multivoc.o:	Game/src/audiolib/multivoc.c
Game/src/audiolib/mv_mix.o:		Game/src/audiolib/mv_mix.c
Game/src/audiolib/mvreverb.o:	Game/src/audiolib/mvreverb.c
Game/src/audiolib/nodpmi.o:		Game/src/audiolib/nodpmi.c
Game/src/audiolib/pitch.o:		Game/src/audiolib/pitch.c
Game/src/audiolib/user.o:		Game/src/audiolib/user.c
Game/src/audiolib/usrhooks.o:	Game/src/audiolib/usrhooks.c

Game/src/midi/sdl_midi.o:	Game/src/midi/sdl_midi.c

