DESTDIR =

prefix  = /usr/local
qmake   = /usr/share/qt3/bin/qmake

hydrogen_headers = \
		config.h \
		\
		src/lib/xml/tinystr.h \
		src/lib/xml/tinyxml.h \
		\
		src/lib/lash/LashClient.h \
		\
		src/lib/drivers/AlsaMidiDriver.h \
		src/lib/drivers/DiskWriterDriver.h \
		src/lib/drivers/GenericDriver.h \
		src/lib/drivers/FakeDriver.h \
		src/lib/drivers/JackDriver.h \
		src/lib/drivers/NullDriver.h \
		src/lib/drivers/OssDriver.h \
		src/lib/drivers/TransportInfo.h \
		src/lib/drivers/AlsaAudioDriver.h \
		src/lib/drivers/MidiDriver.h \
		src/lib/drivers/PortMidiDriver.h \
		src/lib/drivers/PortAudioDriver.h \
		\
		src/lib/fx/LadspaFX.h \
		src/lib/fx/ladspa.h \
		\
		src/lib/smf/SMF.h \
		src/lib/smf/SMFEvent.h \
		\
		src/lib/ADSR.h \
		src/lib/DataPath.h \
		src/lib/EventQueue.h \
		src/lib/Exception.h \
		src/lib/FLACFile.h \
		src/lib/Globals.h \
		src/lib/Hydrogen.h \
		src/lib/LocalFileMng.h \
		src/lib/Object.h \
		src/lib/Preferences.h \
		src/lib/Sample.h \
		src/lib/Song.h \
		\
		\
		src/gui/widgets/Button.h \
		src/gui/widgets/CpuLoadWidget.h \
		src/gui/widgets/ClickableLabel.h \
		src/gui/widgets/Fader.h \
		src/gui/widgets/LCD.h \
		src/gui/widgets/MidiActivityWidget.h \
		src/gui/widgets/Rotary.h \
		\
		src/gui/InstrumentEditor/WaveDisplay.h \
		src/gui/InstrumentEditor/LayerPreview.h \
		src/gui/InstrumentEditor/InstrumentEditor.h \
		\
		src/gui/SongEditor/SongEditor.h \
		src/gui/SongEditor/SongEditorPanel.h \
		\
		src/gui/PatternEditor/PatternEditor.h \
		src/gui/PatternEditor/PatternEditorPanel.h \
		\
		src/gui/Mixer/Mixer.h \
		src/gui/Mixer/MixerLine.h \
		\
		src/gui/AboutDialog.h \
		src/gui/AudioEngineInfoForm.h \
		src/gui/DrumkitManager.h \
		src/gui/ExportSongDialog.h \
		src/gui/EventListener.h \
		src/gui/FilePreview.h \
		src/gui/HelpBrowser.h \
		src/gui/HydrogenApp.h \
		src/gui/LadspaFXProperties.h \
		src/gui/LadspaFXSelector.h \
		src/gui/MainForm.h \
		src/gui/PatternFillDialog.h \
		src/gui/PatternPropertiesDialog.h \
		src/gui/PlayerControl.h \
		src/gui/PreferencesDialog.h \
		src/gui/Skin.h \
		src/gui/SongPropertiesDialog.h \
		src/gui/SplashScreen.h \
		\
		src/cui/CUI.h


hydrogen_sources = \
		src/lib/xml/tinystr.cpp \
		src/lib/xml/tinyxml.cpp \
		src/lib/xml/tinyxmlerror.cpp \
		src/lib/xml/tinyxmlparser.cpp \
		\
		src/lib/lash/LashClient.cpp \
		\
		src/lib/drivers/AlsaMidiDriver.cpp \
		src/lib/drivers/DiskWriterDriver.cpp \
		src/lib/drivers/FakeDriver.cpp \
		src/lib/drivers/JackDriver.cpp \
		src/lib/drivers/NullDriver.cpp \
		src/lib/drivers/OssDriver.cpp \
		src/lib/drivers/TransportInfo.cpp \
		src/lib/drivers/AlsaAudioDriver.cpp \
		src/lib/drivers/MidiDriver.cpp \
		src/lib/drivers/PortMidiDriver.cpp \
		src/lib/drivers/PortAudioDriver.cpp \
		\
		src/lib/fx/LadspaFX.cpp \
		\
		src/lib/smf/SMF.cpp \
		src/lib/smf/SMFEvent.cpp \
		\
		src/lib/ADSR.cpp \
		src/lib/DataPath.cpp \
		src/lib/EventQueue.cpp \
		src/lib/FLACFile.cpp \
		src/lib/Hydrogen.cpp \
		src/lib/LocalFileMng.cpp \
		src/lib/Object.cpp \
		src/lib/Preferences.cpp \
		src/lib/Sample.cpp \
		src/lib/Song.cpp \
		\
		\
		src/gui/UI/AboutDialog_UI.ui \
		src/gui/UI/AudioEngineInfoForm_UI.ui \
		src/gui/UI/DrumkitManager_UI.ui \
		src/gui/UI/ExportSongDialog_UI.ui \
		src/gui/UI/LadspaFXSelector_UI.ui \
		src/gui/UI/PatternFillDialog_UI.ui \
		src/gui/UI/PatternPropertiesDialog_UI.ui \
		src/gui/UI/PreferencesDialog_UI.ui \
		src/gui/UI/SongPropertiesDialog_UI.ui \
		\
		src/gui/widgets/Button.cpp \
		src/gui/widgets/CpuLoadWidget.cpp \
		src/gui/widgets/ClickableLabel.cpp \
		src/gui/widgets/Fader.cpp \
		src/gui/widgets/LCD.cpp \
		src/gui/widgets/MidiActivityWidget.cpp \
		src/gui/widgets/Rotary.cpp \
		\
		src/gui/InstrumentEditor/InstrumentEditor.cpp \
		src/gui/InstrumentEditor/WaveDisplay.cpp \
		src/gui/InstrumentEditor/LayerPreview.cpp \
		\
		src/gui/SongEditor/SongEditor.cpp \
		src/gui/SongEditor/SongEditorPanel.cpp \
		\
		src/gui/PatternEditor/PatternEditor.cpp \
		src/gui/PatternEditor/PatternEditorPanel.cpp \
		\
		src/gui/Mixer/Mixer.cpp \
		src/gui/Mixer/MixerLine.cpp \
		\
		src/gui/AboutDialog.cpp \
		src/gui/AudioEngineInfoForm.cpp \
		src/gui/DrumkitManager.cpp \
		src/gui/ExportSongDialog.cpp \
		src/gui/FilePreview.cpp \
		src/gui/HelpBrowser.cpp \
		src/gui/HydrogenApp.cpp \
		src/gui/LadspaFXProperties.cpp \
		src/gui/LadspaFXSelector.cpp \
		src/gui/MainForm.cpp \
		src/gui/PatternFillDialog.cpp \
		src/gui/PatternPropertiesDialog.cpp \
		src/gui/PlayerControl.cpp \
		src/gui/PreferencesDialog.cpp \
		src/gui/SongPropertiesDialog.cpp \
		src/gui/SplashScreen.cpp \
		src/gui/main.cpp \
		\
		src/cui/CUI.cpp \
		src/cui/hydrogenCUI.cpp \
		\
		src/tools/Hydrogen2Midi.cpp \
		src/tools/HydrogenPlayer.cpp \
		src/tools/HydrogenBenchmark.cpp

all:	hydrogenPlayer hydrogen ladspa_plugins


ladspa_plugins: plugins/Makefile
	@cd plugins; make all

# Hydrogen
hydrogen.mak: hydrogen.pro
	@$(qmake) -o hydrogen.mak hydrogen.pro

hydrogen: hydrogen.mak $(hydrogen_headers) $(hydrogen_sources)
	@make -f hydrogen.mak hydrogen


# Hydrogen Player
hydrogenPlayer.mak: hydrogenPlayer.pro
	@$(qmake) -o hydrogenPlayer.mak hydrogenPlayer.pro

hydrogenPlayer: hydrogenPlayer.mak $(hydrogen_headers) $(hydrogen_sources)
	@make -f hydrogenPlayer.mak hydrogenPlayer

# Hydrogen Benchmark
hydrogenBenchmark.mak: hydrogenBenchmark.pro
	@$(qmake) -o hydrogenBenchmark.mak hydrogenBenchmark.pro

hydrogenBenchmark: hydrogenBenchmark.mak $(hydrogen_headers) $(hydrogen_sources)
	@make -f hydrogenBenchmark.mak hydrogenBenchmark

# Hydrogen 2 Midi
hydrogen2Midi.mak: hydrogen2Midi.pro
	@$(qmake) -o hydrogen2Midi.mak hydrogen2Midi.pro

hydrogen2Midi: hydrogen2Midi.mak $(hydrogen_headers) $(hydrogen_sources)
	@make -f hydrogen2Midi.mak hydrogen2Midi

# Hydrogen CUI
hydrogenCUI.mak: hydrogenCUI.pro
	@$(qmake) -o hydrogenCUI.mak hydrogenCUI.pro

hydrogenCUI: hydrogenCUI.mak $(hydrogen_headers) $(hydrogen_sources)
	@make -f hydrogenCUI.mak hydrogenCUI

install:
	@install -vD hydrogen $(DESTDIR)$(prefix)/bin/hydrogen
	@install -vD hydrogenPlayer $(DESTDIR)$(prefix)/bin/hydrogenPlayer
	@rm -rf $(DESTDIR)$(prefix)/share/hydrogen
	mkdir -p $(DESTDIR)$(prefix)/share/hydrogen/data/
	cp -R data $(DESTDIR)$(prefix)/share/hydrogen
	mkdir -p $(DESTDIR)$(prefix)/share/hydrogen/data/
	@install -vD hydrogen.desktop $(DESTDIR)$(prefix)/share/applications/hydrogen.desktop
	cd plugins;make install;cd ..
	
	
uninstall: $(DESTDIR)$(prefix)/bin/hydrogen
	@rm -vf $(DESTDIR)$(prefix)/bin/hydrogen
	@rm -vf $(DESTDIR)$(prefix)/bin/hydrogenPlayer
	@rm -rf $(DESTDIR)$(prefix)/share/hydrogen
	@rm -f $(DESTDIR)$(prefix)/share/applications/hydrogen.desktop
	cd plugins;make uninstall

clean: hydrogen.mak hydrogenPlayer.mak hydrogenBenchmark.mak
	@make -f hydrogen.mak clean
	@rm -f hydrogen hydrogen.mak
#	@rm -f hydrogen.pro

	@make -f hydrogenPlayer.mak clean
	@rm -f hydrogenPlayer hydrogenPlayer.mak
#	@rm -f hydrogenPlayer.pro

	@make -f hydrogenBenchmark.mak clean
	@rm -f hydrogenBenchmark hydrogenBenchmark.mak
#	@rm -f hydrogenBenchmark.pro

#	@make -f hydrogen2Midi.mak clean
	@rm -f hydrogen2Midi hydrogen2Midi.mak
#	@rm -f hydrogen2Midi.pro

	@rm -f hydrogenCUI hydrogenCUI.mak

	@rm -rf *.cache *.log *.status

	@cd plugins; make clean

