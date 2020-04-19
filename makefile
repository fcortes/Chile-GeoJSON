BC_COMUNAS_URL = "https://www.bcn.cl/obtienearchivo?id=repositorio/10221/10396/2/Comunas.zip"
OUTPUT_FILE ?= comunas.json
OGR_SIMPLIFY ?= 2000

SHAPE_FILES = comunas.shp comunas.shx comunas.prj

$(OUTPUT_FILE): $(SHAPE_FILES)
	ogr2ogr -f GeoJSON -t_srs crs:84 -progress -simplify $(OGR_SIMPLIFY) $@ $<
	underscore print --in $(OUTPUT_FILE) --out $(OUTPUT_FILE) --outfmt dense
	sed -i -E 's/([0-9]{2}\.[0-9]{1,4})[0-9]*/\1/g' $(OUTPUT_FILE)

Comunas.zip:
	wget -O $@ $(BC_COMUNAS_URL)

$(SHAPE_FILES): Comunas.zip
	unzip Comunas.zip $@

clean:
	rm -f $(OUTPUT_FILE)
	rm -f $(SHAPE_FILES)
	rm -f Comunas.zip

.PHONY: clean

