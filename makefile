BC_COMUNAS_URL = "https://www.bcn.cl/obtienearchivo?id=repositorio/10221/10396/2/Comunas.zip"
BC_REGIONES_URL = "https://www.bcn.cl/obtienearchivo?id=repositorio/10221/10398/2/Regiones.zip"
ZIP_FILES := comunas.zip Regional.zip

OUTPUT_FILES ?= comunas.geojson Regional.geojson
OGR_SIMPLIFY ?= 2000

SHAPE_EXTENSIONS := .shp .shx .prj .dbf .sbn .sbx

all: $(OUTPUT_FILES)

%.geojson: %.shp %.shx %.prj %.dbf %.sbn %.sbx
	ogr2ogr -f GeoJSON -t_srs crs:84 -progress -simplify $(OGR_SIMPLIFY) $@ $<
	underscore print --in $@ --out $@ --outfmt dense
	sed -i -E 's/([0-9]{2}\.[0-9]{1,4})[0-9]*/\1/g' $@

comunas.zip:
	wget -O $@ $(BC_COMUNAS_URL)

Regional.zip:
	wget -O $@ $(BC_REGIONES_URL)

%.shp: %.zip
	unzip $< $@
%.shx: %.zip
	unzip $< $@
%.prj: %.zip
	unzip $< $@
%.dbf: %.zip
	unzip $< $@
%.sbn: %.zip
	unzip $< $@
%.sbx: %.zip
	unzip $< $@

clean:
	rm -f $(ZIP_FILES)
	rm -f $(addprefix comunas, $(SHAPE_EXTENSIONS))
	rm -f $(addprefix Regional, $(SHAPE_EXTENSIONS))

clean-all: clean
	rm -f $(OUTPUT_FILES)

.PHONY: clean clean-all

