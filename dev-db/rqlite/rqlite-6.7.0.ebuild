# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit go-module
EGIT_COMMIT=eb6da8f22cfd57d9f46cc31179de7d0cefe2f962

DESCRIPTION="Replicated SQLite using the Raft consensus protocol"
HOMEPAGE="https://github.com/rqlite/rqlite https://www.philipotoole.com/tag/rqlite/"

EGO_SUM=(
"github.com/Bowery/prompt v0.0.0-20190916142128-fa8279994f75"
"github.com/Bowery/prompt v0.0.0-20190916142128-fa8279994f75/go.mod"
"github.com/DataDog/datadog-go v2.2.0+incompatible/go.mod"
"github.com/DataDog/datadog-go v3.2.0+incompatible/go.mod"
"github.com/alecthomas/template v0.0.0-20160405071501-a0175ee3bccc/go.mod"
"github.com/alecthomas/template v0.0.0-20190718012654-fb15b899a751/go.mod"
"github.com/alecthomas/units v0.0.0-20151022065526-2efee857e7cf/go.mod"
"github.com/alecthomas/units v0.0.0-20190717042225-c3de453c63f4/go.mod"
"github.com/armon/go-metrics v0.0.0-20190430140413-ec5e00d3c878/go.mod"
"github.com/armon/go-metrics v0.3.9"
"github.com/armon/go-metrics v0.3.9/go.mod"
"github.com/beorn7/perks v0.0.0-20180321164747-3a771d992973/go.mod"
"github.com/beorn7/perks v1.0.0/go.mod"
"github.com/beorn7/perks v1.0.1/go.mod"
"github.com/boltdb/bolt v1.3.1"
"github.com/boltdb/bolt v1.3.1/go.mod"
"github.com/cespare/xxhash/v2 v2.1.1/go.mod"
"github.com/circonus-labs/circonus-gometrics v2.3.1+incompatible/go.mod"
"github.com/circonus-labs/circonusllhist v0.1.3/go.mod"
"github.com/davecgh/go-spew v1.1.0/go.mod"
"github.com/davecgh/go-spew v1.1.1"
"github.com/davecgh/go-spew v1.1.1/go.mod"
"github.com/fatih/color v1.7.0/go.mod"
"github.com/fatih/color v1.12.0"
"github.com/fatih/color v1.12.0/go.mod"
"github.com/go-kit/kit v0.8.0/go.mod"
"github.com/go-kit/kit v0.9.0/go.mod"
"github.com/go-logfmt/logfmt v0.3.0/go.mod"
"github.com/go-logfmt/logfmt v0.4.0/go.mod"
"github.com/go-stack/stack v1.8.0/go.mod"
"github.com/gogo/protobuf v1.1.1/go.mod"
"github.com/golang/protobuf v1.2.0/go.mod"
"github.com/golang/protobuf v1.3.1/go.mod"
"github.com/golang/protobuf v1.3.2/go.mod"
"github.com/golang/protobuf v1.5.0/go.mod"
"github.com/golang/protobuf v1.5.2"
"github.com/golang/protobuf v1.5.2/go.mod"
"github.com/google/go-cmp v0.3.1/go.mod"
"github.com/google/go-cmp v0.4.0/go.mod"
"github.com/google/go-cmp v0.5.5"
"github.com/google/go-cmp v0.5.5/go.mod"
"github.com/google/gofuzz v1.0.0/go.mod"
"github.com/hashicorp/go-cleanhttp v0.5.0/go.mod"
"github.com/hashicorp/go-hclog v0.9.1/go.mod"
"github.com/hashicorp/go-hclog v0.16.2"
"github.com/hashicorp/go-hclog v0.16.2/go.mod"
"github.com/hashicorp/go-immutable-radix v1.0.0/go.mod"
"github.com/hashicorp/go-immutable-radix v1.3.1"
"github.com/hashicorp/go-immutable-radix v1.3.1/go.mod"
"github.com/hashicorp/go-msgpack v0.5.5/go.mod"
"github.com/hashicorp/go-msgpack v1.1.5"
"github.com/hashicorp/go-msgpack v1.1.5/go.mod"
"github.com/hashicorp/go-retryablehttp v0.5.3/go.mod"
"github.com/hashicorp/go-uuid v1.0.0"
"github.com/hashicorp/go-uuid v1.0.0/go.mod"
"github.com/hashicorp/golang-lru v0.5.0/go.mod"
"github.com/hashicorp/golang-lru v0.5.4"
"github.com/hashicorp/golang-lru v0.5.4/go.mod"
"github.com/hashicorp/raft v1.1.0/go.mod"
"github.com/hashicorp/raft v1.3.1"
"github.com/hashicorp/raft v1.3.1/go.mod"
"github.com/json-iterator/go v1.1.6/go.mod"
"github.com/json-iterator/go v1.1.9/go.mod"
"github.com/julienschmidt/httprouter v1.2.0/go.mod"
"github.com/konsorten/go-windows-terminal-sequences v1.0.1/go.mod"
"github.com/kr/logfmt v0.0.0-20140226030751-b84e30acd515/go.mod"
"github.com/kr/pretty v0.1.0/go.mod"
"github.com/kr/pty v1.1.1/go.mod"
"github.com/kr/text v0.1.0/go.mod"
"github.com/labstack/gommon v0.3.0"
"github.com/labstack/gommon v0.3.0/go.mod"
"github.com/mattn/go-colorable v0.1.2/go.mod"
"github.com/mattn/go-colorable v0.1.4/go.mod"
"github.com/mattn/go-colorable v0.1.7/go.mod"
"github.com/mattn/go-colorable v0.1.8"
"github.com/mattn/go-colorable v0.1.8/go.mod"
"github.com/mattn/go-isatty v0.0.8/go.mod"
"github.com/mattn/go-isatty v0.0.9/go.mod"
"github.com/mattn/go-isatty v0.0.10/go.mod"
"github.com/mattn/go-isatty v0.0.12/go.mod"
"github.com/mattn/go-isatty v0.0.14"
"github.com/mattn/go-isatty v0.0.14/go.mod"
"github.com/matttproud/golang_protobuf_extensions v1.0.1/go.mod"
"github.com/mkideal/cli v0.2.7"
"github.com/mkideal/cli v0.2.7/go.mod"
"github.com/mkideal/expr v0.1.0"
"github.com/mkideal/expr v0.1.0/go.mod"
"github.com/mkideal/pkg v0.1.3"
"github.com/mkideal/pkg v0.1.3/go.mod"
"github.com/modern-go/concurrent v0.0.0-20180228061459-e0a39a4cb421/go.mod"
"github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd/go.mod"
"github.com/modern-go/reflect2 v0.0.0-20180701023420-4b7aa43c6742/go.mod"
"github.com/modern-go/reflect2 v1.0.1/go.mod"
"github.com/mwitkow/go-conntrack v0.0.0-20161129095857-cc309e4a2223/go.mod"
"github.com/pascaldekloe/goe v0.1.0"
"github.com/pascaldekloe/goe v0.1.0/go.mod"
"github.com/pkg/errors v0.8.0/go.mod"
"github.com/pkg/errors v0.8.1/go.mod"
"github.com/pmezard/go-difflib v1.0.0"
"github.com/pmezard/go-difflib v1.0.0/go.mod"
"github.com/prometheus/client_golang v0.9.1/go.mod"
"github.com/prometheus/client_golang v0.9.2/go.mod"
"github.com/prometheus/client_golang v1.0.0/go.mod"
"github.com/prometheus/client_golang v1.4.0/go.mod"
"github.com/prometheus/client_model v0.0.0-20180712105110-5c3871d89910/go.mod"
"github.com/prometheus/client_model v0.0.0-20190129233127-fd36f4220a90/go.mod"
"github.com/prometheus/client_model v0.2.0/go.mod"
"github.com/prometheus/common v0.0.0-20181126121408-4724e9255275/go.mod"
"github.com/prometheus/common v0.4.1/go.mod"
"github.com/prometheus/common v0.9.1/go.mod"
"github.com/prometheus/procfs v0.0.0-20181005140218-185b4288413d/go.mod"
"github.com/prometheus/procfs v0.0.0-20181204211112-1dc9a6cbc91a/go.mod"
"github.com/prometheus/procfs v0.0.2/go.mod"
"github.com/prometheus/procfs v0.0.8/go.mod"
"github.com/rqlite/go-sqlite3 v1.22.0"
"github.com/rqlite/go-sqlite3 v1.22.0/go.mod"
"github.com/rqlite/raft-boltdb v0.0.0-20210909125202-124e0a496d7e"
"github.com/rqlite/raft-boltdb v0.0.0-20210909125202-124e0a496d7e/go.mod"
"github.com/rqlite/raft-boltdb v0.0.0-20210909131733-595768e10065"
"github.com/rqlite/raft-boltdb v0.0.0-20210909131733-595768e10065/go.mod"
"github.com/sirupsen/logrus v1.2.0/go.mod"
"github.com/sirupsen/logrus v1.4.2/go.mod"
"github.com/stretchr/objx v0.1.0/go.mod"
"github.com/stretchr/objx v0.1.1/go.mod"
"github.com/stretchr/testify v1.2.2/go.mod"
"github.com/stretchr/testify v1.3.0/go.mod"
"github.com/stretchr/testify v1.4.0"
"github.com/stretchr/testify v1.4.0/go.mod"
"github.com/tv42/httpunix v0.0.0-20150427012821-b75d8614f926/go.mod"
"github.com/valyala/bytebufferpool v1.0.0/go.mod"
"github.com/valyala/fasttemplate v1.0.1/go.mod"
"golang.org/x/crypto v0.0.0-20180904163835-0709b304e793/go.mod"
"golang.org/x/crypto v0.0.0-20190308221718-c2843e01d9a2/go.mod"
"golang.org/x/crypto v0.0.0-20200622213623-75b288015ac9/go.mod"
"golang.org/x/crypto v0.0.0-20201221181555-eec23a3978ad/go.mod"
"golang.org/x/crypto v0.0.0-20210817164053-32db794688a5"
"golang.org/x/crypto v0.0.0-20210817164053-32db794688a5/go.mod"
"golang.org/x/net v0.0.0-20181114220301-adae6a3d119a/go.mod"
"golang.org/x/net v0.0.0-20181201002055-351d144fa1fc/go.mod"
"golang.org/x/net v0.0.0-20190311183353-d8887717615a/go.mod"
"golang.org/x/net v0.0.0-20190404232315-eb5bcb51f2a3/go.mod"
"golang.org/x/net v0.0.0-20190613194153-d28f0bde5980/go.mod"
"golang.org/x/net v0.0.0-20200707034311-ab3426394381/go.mod"
"golang.org/x/net v0.0.0-20210226172049-e18ecbb05110"
"golang.org/x/net v0.0.0-20210226172049-e18ecbb05110/go.mod"
"golang.org/x/sync v0.0.0-20181108010431-42b317875d0f/go.mod"
"golang.org/x/sync v0.0.0-20181221193216-37e7f081c4d4/go.mod"
"golang.org/x/sync v0.0.0-20190423024810-112230192c58/go.mod"
"golang.org/x/sync v0.0.0-20190911185100-cd5d95a43a6e/go.mod"
"golang.org/x/sys v0.0.0-20180905080454-ebe1bf3edb33/go.mod"
"golang.org/x/sys v0.0.0-20181116152217-5ac8a444bdc5/go.mod"
"golang.org/x/sys v0.0.0-20190215142949-d0b11bdaac8a/go.mod"
"golang.org/x/sys v0.0.0-20190222072716-a9d3bda3a223/go.mod"
"golang.org/x/sys v0.0.0-20190412213103-97732733099d/go.mod"
"golang.org/x/sys v0.0.0-20190422165155-953cdadca894/go.mod"
"golang.org/x/sys v0.0.0-20190813064441-fde4db37ae7a/go.mod"
"golang.org/x/sys v0.0.0-20191008105621-543471e840be/go.mod"
"golang.org/x/sys v0.0.0-20191026070338-33540a1f6037/go.mod"
"golang.org/x/sys v0.0.0-20200116001909-b77594299b42/go.mod"
"golang.org/x/sys v0.0.0-20200122134326-e047566fdf82/go.mod"
"golang.org/x/sys v0.0.0-20200223170610-d5e6a3e2c0ae/go.mod"
"golang.org/x/sys v0.0.0-20200323222414-85ca7c5b95cd/go.mod"
"golang.org/x/sys v0.0.0-20201119102817-f84b799fce68/go.mod"
"golang.org/x/sys v0.0.0-20210615035016-665e8c7367d1/go.mod"
"golang.org/x/sys v0.0.0-20210630005230-0f9fa26af87c/go.mod"
"golang.org/x/sys v0.0.0-20210908233432-aa78b53d3365"
"golang.org/x/sys v0.0.0-20210908233432-aa78b53d3365/go.mod"
"golang.org/x/term v0.0.0-20201117132131-f5c789dd3221/go.mod"
"golang.org/x/term v0.0.0-20201126162022-7de9c90e9dd1/go.mod"
"golang.org/x/term v0.0.0-20210615171337-6886f2dfbf5b"
"golang.org/x/term v0.0.0-20210615171337-6886f2dfbf5b/go.mod"
"golang.org/x/text v0.3.0/go.mod"
"golang.org/x/text v0.3.3"
"golang.org/x/text v0.3.3/go.mod"
"golang.org/x/tools v0.0.0-20180917221912-90fa682c2a6e/go.mod"
"golang.org/x/tools v0.0.0-20190424220101-1e8e1cfdf96b/go.mod"
"golang.org/x/xerrors v0.0.0-20191204190536-9bdfabe68543"
"golang.org/x/xerrors v0.0.0-20191204190536-9bdfabe68543/go.mod"
"google.golang.org/protobuf v1.26.0-rc.1/go.mod"
"google.golang.org/protobuf v1.26.0/go.mod"
"google.golang.org/protobuf v1.27.1"
"google.golang.org/protobuf v1.27.1/go.mod"
"gopkg.in/alecthomas/kingpin.v2 v2.2.6/go.mod"
"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
"gopkg.in/check.v1 v1.0.0-20190902080502-41f04d3bba15/go.mod"
"gopkg.in/yaml.v2 v2.2.1/go.mod"
"gopkg.in/yaml.v2 v2.2.2/go.mod"
"gopkg.in/yaml.v2 v2.2.4/go.mod"
"gopkg.in/yaml.v2 v2.2.5"
"gopkg.in/yaml.v2 v2.2.5/go.mod"
)
go-module_set_globals
SRC_URI="https://github.com/rqlite/rqlite/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${EGO_SUM_SRC_URI}"

LICENSE="MIT Apache-2.0 BSD CC0-1.0 MPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_compile() {
	GOBIN="${S}/bin" \
		go install \
			-ldflags="-X main.version=v${PV}
				-X main.branch=master
				-X main.commit=${EGIT_COMMIT}
				-X main.buildtime=$(date +%Y-%m-%dT%T%z)" \
			./cmd/... || die
}

src_test() {
	GOBIN="${S}/bin" \
		go test ./... || die
}

src_install() {
	dobin bin/*
	dodoc -r *.md DOC
}
