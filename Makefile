
PROJECT_NAME=vtest

SOURCES=icestick_top.v bin2grey.v

BLIF=$(PROJECT_NAME).blif
BT=$(PROJECT_NAME).bt
BIN=$(PROJECT_NAME).bin
PCF=$(PROJECT_NAME).PCF


YOSYS=../yosys/yosys
ARACHE=../arachne-pnr/bin/arachne-pnr
ICEPACK=../icestorm/icepack/icepack
ICEPROG=../icestorm/iceprog/iceprog

$(BIN): $(BT)
	$(ICEPACK) $(BT) $(BIN) >> $(PROJECT_NAME).log

$(BT): $(BLIF) $(PCF)
	$(ARACHE) -d 1k -p $(PCF) $(BLIF) -o $(BT) >> $(PROJECT_NAME).log

$(BLIF): $(SOURCES)
	$(YOSYS) -p "synth_ice40 -top top -blif $(BLIF)" $(SOURCES) > $(PROJECT_NAME).log

clean:
	rm $(BLIF) $(BT) $(BIN) 

run: $(BIN)
	$(ICEPROG) $(BIN)