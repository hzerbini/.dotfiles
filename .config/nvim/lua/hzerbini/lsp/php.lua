local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- intelephense config

require("lspconfig").intelephense.setup({
	capabilities = capabilities,
    init_options = {
        licenceKey = vim.fn.expand('$HOME') .. '/pCloudDrive/Personal/intelephense-key.txt',
    },
	settings = {
		intelephense = {
			stubs = {
				"bcmath",
				"bz2",
				"Core",
				"curl",
				"date",
				"dom",
				"fileinfo",
				"filter",
				"gd",
				"gettext",
				"hash",
				"iconv",
				"imap",
				"intl",
				"json",
				"libxml",
				"mbstring",
				"mcrypt",
				"mysql",
				"mysqli",
				"password",
				"pcntl",
				"pcre",
				"PDO",
				"pdo_mysql",
				"Phar",
				"readline",
				"regex",
				"session",
				"SimpleXML",
				"sockets",
				"sodium",
				"standard",
				"superglobals",
				"tokenizer",
				"xml",
				"xdebug",
				"xmlreader",
				"xmlwriter",
				"yaml",
				"zip",
				"zlib",
				"wordpress-stubs",
				"woocommerce-stubs",
				"acf-pro-stubs",
				"wordpress-globals",
				"wp-cli-stubs",
				"genesis-stubs",
				"polylang-stubs",
			},
			environment = {
				includePaths = {
					"/home/zerbini/.config/composer/vendor/php-stubs/",
					"/home/zerbini/.config/composer/vendor/wpsyntex/",
				},
                excludePaths = {
                    "vendor/cmixin/business-day/types/**"
                },
			},
			files = {
				maxSize = 5000000,
			},
		},
	},
})
