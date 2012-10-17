
PLUGIN_NAME=plugin-filtering
PLUGIN_DIR=$(DESTDIR)/usr/share/redmine/vendor/plugins/$(PLUGIN_NAME)
REDMINE_DIR=$(DESTDIR)/usr/share/redmine

INSTALL_FILES=\
	LICENSE		\
	README.rdoc	\
	app		\
	assets		\
	config		\
	init.rb		\
	lib

all:

install:
	@rm -Rf $(PLUGIN_DIR)
	@mkdir -p $(PLUGIN_DIR) $(REDMINE_DIR)/public/plugin_assets
	@for i in $(INSTALL_FILES) ; do cp -R --preserve $$i $(PLUGIN_DIR) ; done
	@( cd $(REDMINE_DIR)/public/plugin_assets && ln -sf ../../vendor/plugins/$(PLUGIN_NAME)/assets $(PLUGIN_NAME) )
