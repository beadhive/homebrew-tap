class Beadhive < Formula
  include Language::Python::Virtualenv

  desc "Beadhive CLI — the integration-plane driver for Agentic Git Flow (AGF)"
  homepage "https://github.com/beadhive/beadhive"
  url "https://files.pythonhosted.org/packages/5c/46/cd029d3cd4ce251a6e1eebffb350d46ca20c281879fb91b215eb7bae8195/beadhive-0.1.0.tar.gz"
  sha256 "9170419dc4a581137030ce6053a96ba8495763f4a57a6dee6e281be06e50e606"
  # TODO: no LICENSE file in beadhive/beadhive and no license classifier on PyPI
  # yet — add a `license` field here once the source repo declares one.

  depends_on "python@3.13"

  resource "aiofile" do
    url "https://files.pythonhosted.org/packages/67/cd/0d76dfc5de72bde52f55f53e925c7d152d9c7906634ec1e0cbc7e8d4ad93/aiofile-3.11.1-py3-none-any.whl"
    sha256 "ce77d14ac07f77bc2b757834a5c129321f3f705c474593deed5ab209079a52c9"
  end

  resource "annotated-doc" do
    url "https://files.pythonhosted.org/packages/1e/d3/26bf1008eb3d2daa8ef4cacc7f3bfdc11818d111f7e2d0201bc6e3b49d45/annotated_doc-0.0.4-py3-none-any.whl"
    sha256 "571ac1dc6991c450b25a9c2d84a3705e2ae7a53467b5d111c24fa8baabbed320"
  end

  resource "annotated-types" do
    url "https://files.pythonhosted.org/packages/78/b6/6307fbef88d9b5ee7421e68d78a9f162e0da4900bc5f5793f6d3d0e34fb8/annotated_types-0.7.0-py3-none-any.whl"
    sha256 "1f02e8b43a8fbbc3f3e0d4f0f4bfc8131bcb4eebe8849b8e5c773f3a1c582a53"
  end

  resource "anyio" do
    url "https://files.pythonhosted.org/packages/b0/7b/90df4a0a816d98d6ea26f559d87836d494a2cf1fcf063be67df50a7bcc30/anyio-4.14.1-py3-none-any.whl"
    sha256 "4e5533c5b8ff0a24f5d7a176cbe6877129cd183893f66b537f8f227d10527d72"
  end

  resource "attrs" do
    url "https://files.pythonhosted.org/packages/64/b4/17d4b0b2a2dc85a6df63d1157e028ed19f90d4cd97c36717afef2bc2f395/attrs-26.1.0-py3-none-any.whl"
    sha256 "c647aa4a12dfbad9333ca4e71fe62ddc36f4e63b2d260a37a8b83d2f043ac309"
  end

  resource "Authlib" do
    url "https://files.pythonhosted.org/packages/fb/95/adcb68e20c34162e9135f370d6e31737719c2b6f94bc953fe7ed1f10fe21/authlib-1.7.2-py2.py3-none-any.whl"
    sha256 "3e1faedc9d87e7d56a164eca3ccb6ace0d61b94abe83e92242f8dc8bba9b4a9f"
  end

  resource "beartype" do
    url "https://files.pythonhosted.org/packages/71/cc/18245721fa7747065ab478316c7fea7c74777d07f37ae60db2e84f8172e8/beartype-0.22.9-py3-none-any.whl"
    sha256 "d16c9bbc61ea14637596c5f6fbff2ee99cbe3573e46a716401734ef50c3060c2"
  end

  resource "cachetools" do
    url "https://files.pythonhosted.org/packages/8c/7b/1fc1c09cc0756cf25861a3be10565915953876da48bb228fb9a672b20a42/cachetools-7.1.4-py3-none-any.whl"
    sha256 "323dc4127934744db5b54eb4924482d7edafbf9554e820d1531c2e08c0e4ef54"
  end

  resource "caio" do
    url "https://files.pythonhosted.org/packages/31/57/5e6ff127e6f62c9f15d989560435c642144aa4210882f9494204bc892305/caio-0.9.25-cp313-cp313-macosx_10_13_universal2.whl"
    sha256 "d6c2a3411af97762a2b03840c3cec2f7f728921ff8adda53d7ea2315a8563451"
  end

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/ef/2f/c5464532e965badff2f4c4c1a3a83f5697f0d7c407ed0cda44aaa99bb451/certifi-2026.6.17-py3-none-any.whl"
    sha256 "2227dcbaafe0d2f59279d1762ddddc37783ed4354594f194ffc31d20f41fc3db"
  end

  resource "cffi" do
    url "https://files.pythonhosted.org/packages/84/4c/82f132cb4418ee6d953d982b19191e87e2a6372c8a4ce36e50b69d6ade4a/cffi-2.1.0-cp313-cp313-macosx_11_0_arm64.whl"
    sha256 "716ff8ec22f20b4d988b12884086bcef0fc99737043e503f7a3935a6be99b1ea"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/fb/e2/79c688af8b210d232694e31e59da9f6ec747bae31c3f5946e4e9b98860d5/click-8.4.2-py3-none-any.whl"
    sha256 "e6f9f66136c816745b9d65817da91d61d957fb16e02e4dcd0552553c5a197b76"
  end

  resource "cryptography" do
    url "https://files.pythonhosted.org/packages/9b/22/adf66990e63584a68dfb50c24f48a125c07b1699899381c8151e63ed458c/cryptography-49.0.0-cp311-abi3-macosx_11_0_arm64.whl"
    sha256 "966fe0e9c67490071f14c0d2b1cb2dfb3023c5ce39457343931415f08382f2db"
  end

  resource "cyclopts" do
    url "https://files.pythonhosted.org/packages/b4/f6/1c671874560a70d902dd57028a75411c176910de2df3d6a6a533de424131/cyclopts-4.21.0-py3-none-any.whl"
    sha256 "ded3ddb15b0c815f44d245011fc4cdd5a4809a3bb8202869e9e02195a87c0e18"
  end

  resource "dnspython" do
    url "https://files.pythonhosted.org/packages/ba/5a/18ad964b0086c6e62e2e7500f7edc89e3faa45033c71c1893d34eed2b2de/dnspython-2.8.0-py3-none-any.whl"
    sha256 "01d9bbc4a2d76bf0db7c1f729812ded6d912bd318d3b1cf81d30c0f845dbf3af"
  end

  resource "docstring_parser" do
    url "https://files.pythonhosted.org/packages/a7/5f/ed01f9a3cdffbd5a008556fc7b2a08ddb1cc6ace7effa7340604b1d16699/docstring_parser-0.18.0-py3-none-any.whl"
    sha256 "b3fcbed555c47d8479be0796ef7e19c2670d428d72e96da63f3a40122860374b"
  end

  resource "email-validator" do
    url "https://files.pythonhosted.org/packages/de/15/545e2b6cf2e3be84bc1ed85613edd75b8aea69807a71c26f4ca6a9258e82/email_validator-2.3.0-py3-none-any.whl"
    sha256 "80f13f623413e6b197ae73bb10bf4eb0908faf509ad8362c5edeb0be7fd450b4"
  end

  resource "exceptiongroup" do
    url "https://files.pythonhosted.org/packages/8a/0e/97c33bf5009bdbac74fd2beace167cab3f978feb69cc36f1ef79360d6c4e/exceptiongroup-1.3.1-py3-none-any.whl"
    sha256 "a7a39a3bd276781e98394987d3a5701d0c4edffb633bb7a5144577f82c773598"
  end

  resource "fastmcp" do
    url "https://files.pythonhosted.org/packages/5f/67/3cef84ba38a23dca1e1e776bfda8a35ab3c7a6c94a8ca81d0715de6dd3c5/fastmcp-3.4.4-py3-none-any.whl"
    sha256 "f86f208713212260068cf55c32936839eee856fefc7808e18a032f31eb0f718e"
  end

  resource "fastmcp-slim" do
    url "https://files.pythonhosted.org/packages/16/91/321e0b2e9ed70d0628b17ddaec76fc7b09f3e1d5d290f70bf101a2890142/fastmcp_slim-3.4.4-py3-none-any.whl"
    sha256 "9d3a6327b9ee835188eb7323fc3b5d4cd061631b48da8ece56794bb538972505"
  end

  resource "griffelib" do
    url "https://files.pythonhosted.org/packages/e4/d3/5268aeabf2ad82658c4e2ff3a060648d0f02f3926cb53247c0e4d0dab49e/griffelib-2.1.0-py3-none-any.whl"
    sha256 "cc7b3d2d2865ad0b909fcc38086e3f554b5ea7acbaa7bbb7ecaa3f5dfb7d9f00"
  end

  resource "h11" do
    url "https://files.pythonhosted.org/packages/04/4b/29cac41a4d98d144bf5f6d33995617b185d14b22401f75ca86f384e87ff1/h11-0.16.0-py3-none-any.whl"
    sha256 "63cf8bbe7522de3bf65932fda1d9c2772064ffb3dae62d55932da54b31cb6c86"
  end

  resource "httpcore" do
    url "https://files.pythonhosted.org/packages/7e/f5/f66802a942d491edb555dd61e3a9961140fd64c90bce1eafd741609d334d/httpcore-1.0.9-py3-none-any.whl"
    sha256 "2d400746a40668fc9dec9810239072b40b4484b640a8c38fd654a024c7a1bf55"
  end

  resource "httpx" do
    url "https://files.pythonhosted.org/packages/2a/39/e50c7c3a983047577ee07d2a9e53faf5a69493943ec3f6a384bdc792deb2/httpx-0.28.1-py3-none-any.whl"
    sha256 "d909fcccc110f8c7faf814ca82a9a4d816bc5a6dbfea25d6591d6985b8ba59ad"
  end

  resource "httpx-sse" do
    url "https://files.pythonhosted.org/packages/d2/fd/6668e5aec43ab844de6fc74927e155a3b37bf40d7c3790e49fc0406b6578/httpx_sse-0.4.3-py3-none-any.whl"
    sha256 "0ac1c9fe3c0afad2e0ebb25a934a59f4c7823b60792691f779fad2c5568830fc"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/1e/5e/d4e9f1a599fb8e573b7b87160658329fbf28d19eac2718f51fc3def3aa5a/idna-3.18-py3-none-any.whl"
    sha256 "7f952cbe720b688055e3f87de14f5c3e5fdaa8bc3928985c4077ca689de849a2"
  end

  resource "jaraco.classes" do
    url "https://files.pythonhosted.org/packages/7f/66/b15ce62552d84bbfcec9a4873ab79d993a1dd4edb922cbfccae192bd5b5f/jaraco.classes-3.4.0-py3-none-any.whl"
    sha256 "f662826b6bed8cace05e7ff873ce0f9283b5c924470fe664fff1c2f00f581790"
  end

  resource "jaraco.context" do
    url "https://files.pythonhosted.org/packages/f2/58/bc8954bda5fcda97bd7c19be11b85f91973d67a706ed4a3aec33e7de22db/jaraco_context-6.1.2-py3-none-any.whl"
    sha256 "bf8150b79a2d5d91ae48629d8b427a8f7ba0e1097dd6202a9059f29a36379535"
  end

  resource "jaraco.functools" do
    url "https://files.pythonhosted.org/packages/96/9a/982e48afcffcd727a9144506720ffd4224b6b7e355c98641866f38b7c043/jaraco_functools-4.5.0-py3-none-any.whl"
    sha256 "79ce39246eddbde4b3a03b77ea5f0f7878dc669b166a66cf3fa8e266aa3fa2f4"
  end

  resource "joserfc" do
    url "https://files.pythonhosted.org/packages/7d/f5/650b59d1b74f5befb7a7a7e7d7c92a26b94256df3541e2b4914152cd177a/joserfc-1.7.3-py3-none-any.whl"
    sha256 "7c39f3f2c943dbc03122747fa8ebbd8e156e54904cf25651b452f4d2634a6075"
  end

  resource "jsonref" do
    url "https://files.pythonhosted.org/packages/0c/ec/e1db9922bceb168197a558a2b8c03a7963f1afe93517ddd3cf99f202f996/jsonref-1.1.0-py3-none-any.whl"
    sha256 "590dc7773df6c21cbf948b5dac07a72a251db28b0238ceecce0a2abfa8ec30a9"
  end

  resource "jsonschema" do
    url "https://files.pythonhosted.org/packages/69/90/f63fb5873511e014207a475e2bb4e8b2e570d655b00ac19a9a0ca0a385ee/jsonschema-4.26.0-py3-none-any.whl"
    sha256 "d489f15263b8d200f8387e64b4c3a75f06629559fb73deb8fdfb525f2dab50ce"
  end

  resource "jsonschema-path" do
    url "https://files.pythonhosted.org/packages/04/2c/9e69d73c4297508be9e3b64a970ea3971b3eb8db64ffc5802d40bd25981f/jsonschema_path-0.5.0-py3-none-any.whl"
    sha256 "2790a070bc7abb08ea3dbe4d340ece4efadf639223001f020c7503229ba068e2"
  end

  resource "jsonschema-specifications" do
    url "https://files.pythonhosted.org/packages/41/45/1a4ed80516f02155c51f51e8cedb3c1902296743db0bbc66608a0db2814f/jsonschema_specifications-2025.9.1-py3-none-any.whl"
    sha256 "98802fee3a11ee76ecaca44429fda8a41bff98b00a0f2838151b113f210cc6fe"
  end

  resource "keyring" do
    url "https://files.pythonhosted.org/packages/81/db/e655086b7f3a705df045bf0933bdd9c2f79bb3c97bfef1384598bb79a217/keyring-25.7.0-py3-none-any.whl"
    sha256 "be4a0b195f149690c166e850609a477c532ddbfbaed96a404d4e43f8d5e2689f"
  end

  resource "markdown-it-py" do
    url "https://files.pythonhosted.org/packages/b3/81/4da04ced5a082363ecfa159c010d200ecbd959ae410c10c0264a38cac0f5/markdown_it_py-4.2.0-py3-none-any.whl"
    sha256 "9f7ebbcd14fe59494226453aed97c1070d83f8d24b6fc3a3bcf9a38092641c4a"
  end

  resource "mcp" do
    url "https://files.pythonhosted.org/packages/e2/5e/d118fce19f87a2e7d8101c35c8ae0ec289098a4df0ff244cec23e415aca0/mcp-1.28.1-py3-none-any.whl"
    sha256 "2726bca5e7193f61c5dde8b12500a6de2d9acf6d1a1c0be9e8c2e706437991df"
  end

  resource "mdurl" do
    url "https://files.pythonhosted.org/packages/b3/38/89ba8ad64ae25be8de66a6d463314cf1eb366222074cfda9ee839c56a4b4/mdurl-0.1.2-py3-none-any.whl"
    sha256 "84008a41e51615a49fc9966191ff91509e3c40b939176e643fd50a5c2196b8f8"
  end

  resource "more-itertools" do
    url "https://files.pythonhosted.org/packages/e8/3d/1087453384dbde46a8c7f9356eead2c58be8a7bf156bca40243377c85715/more_itertools-11.1.0-py3-none-any.whl"
    sha256 "4b65538ae22f6fed0ce4874efd317463a7489796a0939fa66824dd542125a192"
  end

  resource "openapi-pydantic" do
    url "https://files.pythonhosted.org/packages/12/cf/03675d8bd8ecbf4445504d8071adab19f5f993676795708e36402ab38263/openapi_pydantic-0.5.1-py3-none-any.whl"
    sha256 "a3a09ef4586f5bd760a8df7f43028b60cafb6d9f61de2acba9574766255ab146"
  end

  resource "opentelemetry-api" do
    url "https://files.pythonhosted.org/packages/17/83/6dba32b85f31868400440dc7ad2ca1eab94cbbf3a7b0459ed39f8311a9e2/opentelemetry_api-1.43.0-py3-none-any.whl"
    sha256 "20acf45e9b21851926835292e4045d290acade1edd2ff3de86d2f069687ba1fd"
  end

  resource "packaging" do
    url "https://files.pythonhosted.org/packages/df/b2/87e62e8c3e2f4b32e5fe99e0b86d576da1312593b39f47d8ceef365e95ed/packaging-26.2-py3-none-any.whl"
    sha256 "5fc45236b9446107ff2415ce77c807cee2862cb6fac22b8a73826d0693b0980e"
  end

  resource "pathable" do
    url "https://files.pythonhosted.org/packages/a2/e8/6d75ffd9784bce2e93d1ae4415649427e39a53bb172d4672b2b59c6f0a7b/pathable-0.6.0-py3-none-any.whl"
    sha256 "82c4ca6c98c502ad12e0d4e9779b6210afee93c38990988c8c5d1b49bdcdf566"
  end

  resource "platformdirs" do
    url "https://files.pythonhosted.org/packages/81/e6/cd9575ac904136b3cbf7aa7ee819ef86eedb7274e46f230e94ea4342e729/platformdirs-4.10.0-py3-none-any.whl"
    sha256 "fb516cdb12eb0d857d0cd85a7c57cea4d060bee4578d6cf5a14dfdf8cbf8784a"
  end

  resource "py-key-value-aio" do
    url "https://files.pythonhosted.org/packages/f6/95/b8ba862968712caa12a19666175334fa979e1f198b896a430adb3bacfe87/py_key_value_aio-0.4.5-py3-none-any.whl"
    sha256 "ab862adbcb8c72547d1c57821f22cbbb71ab86509039c96f36e914e0336c8dd7"
  end

  resource "pycparser" do
    url "https://files.pythonhosted.org/packages/0c/c3/44f3fbbfa403ea2a7c779186dc20772604442dde72947e7d01069cbe98e3/pycparser-3.0-py3-none-any.whl"
    sha256 "b727414169a36b7d524c1c3e31839a521725078d7b2ff038656844266160a992"
  end

  resource "pydantic" do
    url "https://files.pythonhosted.org/packages/fd/7b/122376b1fd3c62c1ed9dc80c931ace4844b3c55407b6fb2d199377c9736f/pydantic-2.13.4-py3-none-any.whl"
    sha256 "45a282cde31d808236fd7ea9d919b128653c8b38b393d1c4ab335c62924d9aba"
  end

  resource "pydantic-settings" do
    url "https://files.pythonhosted.org/packages/77/c1/6e422f34e569cf8e18df68d1939c81c099d2b61e4f7d9621c8a77560799c/pydantic_settings-2.14.2-py3-none-any.whl"
    sha256 "a20c97b37910b6550d5ea50fbcc2d4187defe58cd57070b73863d069419c9440"
  end

  resource "pydantic_core" do
    url "https://files.pythonhosted.org/packages/c1/81/4fa520eaffa8bd7d1525e644cd6d39e7d60b1592bc5b516693c7340b50f1/pydantic_core-2.46.4-cp313-cp313-macosx_11_0_arm64.whl"
    sha256 "c94f0688e7b8d0a67abf40e57a7eaaecd17cc9586706a31b76c031f63df052b4"
  end

  resource "Pygments" do
    url "https://files.pythonhosted.org/packages/f4/7e/a72dd26f3b0f4f2bf1dd8923c85f7ceb43172af56d63c7383eb62b332364/pygments-2.20.0-py3-none-any.whl"
    sha256 "81a9e26dd42fd28a23a2d169d86d7ac03b46e2f8b59ed4698fb4785f946d0176"
  end

  resource "PyJWT" do
    url "https://files.pythonhosted.org/packages/a3/5e/ecf12fdb62546d64385c158514e9b2b671f7832108ef2ecd2020ce0af2d1/pyjwt-2.13.0-py3-none-any.whl"
    sha256 "66adcc2aff09b3f1bbd95fc1e1577df8ac8723c978552fd43304c8a290ac5728"
  end

  resource "pyperclip" do
    url "https://files.pythonhosted.org/packages/df/80/fc9d01d5ed37ba4c42ca2b55b4339ae6e200b456be3a1aaddf4a9fa99b8c/pyperclip-1.11.0-py3-none-any.whl"
    sha256 "299403e9ff44581cb9ba2ffeed69c7aa96a008622ad0c46cb575ca75b5b84273"
  end

  resource "python-dotenv" do
    url "https://files.pythonhosted.org/packages/0b/d7/1959b9648791274998a9c3526f6d0ec8fd2233e4d4acce81bbae76b44b2a/python_dotenv-1.2.2-py3-none-any.whl"
    sha256 "1d8214789a24de455a8b8bd8ae6fe3c6b69a5e3d64aa8a8e5d68e694bbcb285a"
  end

  resource "python-multipart" do
    url "https://files.pythonhosted.org/packages/e1/04/e8135ebd1ad02c56ec633277529b2602ff99ff634be76cdba5744cf554fd/python_multipart-0.0.32-py3-none-any.whl"
    sha256 "ff6d3f776f16878c894e52e107296ffc890e913c611b1a4ec6c44e2821fe2e23"
  end

  resource "PyYAML" do
    url "https://files.pythonhosted.org/packages/b1/16/95309993f1d3748cd644e02e38b75d50cbc0d9561d21f390a76242ce073f/pyyaml-6.0.3-cp313-cp313-macosx_11_0_arm64.whl"
    sha256 "2283a07e2c21a2aa78d9c4442724ec1eb15f5e42a723b99cb3d822d48f5f7ad1"
  end

  resource "referencing" do
    url "https://files.pythonhosted.org/packages/2c/58/ca301544e1fa93ed4f80d724bf5b194f6e4b945841c5bfd555878eea9fcb/referencing-0.37.0-py3-none-any.whl"
    sha256 "381329a9f99628c9069361716891d34ad94af76e461dcb0335825aecc7692231"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/82/3b/64d4899d73f91ba49a8c18a8ff3f0ea8f1c1d75481760df8c68ef5235bf5/rich-15.0.0-py3-none-any.whl"
    sha256 "33bd4ef74232fb73fe9279a257718407f169c09b78a87ad3d296f548e27de0bb"
  end

  resource "rich-rst" do
    url "https://files.pythonhosted.org/packages/2a/68/1fc93dd759605b5d00fc98b50200739e41ed32bd22d6ba35ca6c3932371b/rich_rst-2.1.0-py3-none-any.whl"
    sha256 "7ecd1343ee12c879d0e7ae74c3eb6d263b023d2929c6d114212eb1fd91057255"
  end

  resource "rpds-py" do
    url "https://files.pythonhosted.org/packages/f3/6b/686d9dc4359a8f163cfbbf89ee0b4e586431de22fe8248edb63a8cf50d49/rpds_py-2026.6.3-cp313-cp313-macosx_11_0_arm64.whl"
    sha256 "f4d78253f6996be4901669ad25319f842f740eccf4d58e3c7f3dd39e6dde1d8f"
  end

  resource "ruamel.yaml" do
    url "https://files.pythonhosted.org/packages/b8/0c/51f6841f1d84f404f92463fc2b1ba0da357ca1e3db6b7fbda26956c3b82a/ruamel_yaml-0.19.1-py3-none-any.whl"
    sha256 "27592957fedf6e0b62f281e96effd28043345e0e66001f97683aa9a40c667c93"
  end

  resource "shellingham" do
    url "https://files.pythonhosted.org/packages/e0/f9/0595336914c5619e5f28a1fb793285925a8cd4b432c9da0a987836c7f822/shellingham-1.5.4-py2.py3-none-any.whl"
    sha256 "7ecfff8f2fd72616f7481040475a65b2bf8af90a56c89140852d1120324e8686"
  end

  resource "sse-starlette" do
    url "https://files.pythonhosted.org/packages/78/75/c88d3f5dafd59c791da1ce27650d30bf5b70cbf1cbf01cd00e5f9e360915/sse_starlette-3.4.5-py3-none-any.whl"
    sha256 "e71bad53323f65573c3864a6c3bd0c1eb6e5f092b2e48082b0c35927d19ca296"
  end

  resource "starlette" do
    url "https://files.pythonhosted.org/packages/ec/bb/2799cc2ede3ed41131f8975621e7213dfc7ef4acbbaadfa440f32500c370/starlette-1.3.1-py3-none-any.whl"
    sha256 "c7372aae11c3c3f26a42df7bd626cec2f47d03483d261d369516a615a53714c6"
  end

  resource "structlog" do
    url "https://files.pythonhosted.org/packages/a9/18/489c97b834dfff9cf2fc2507cede4bcd4b11e67f84bc462acd1992496f86/structlog-26.1.0-py3-none-any.whl"
    sha256 "e081a26d6c373e6d201eca24eede26d8ffab07f88f477822e679183428d3d91e"
  end

  resource "typer" do
    url "https://files.pythonhosted.org/packages/80/87/b9fd69c92c6102a066e1b86a35243f53e70bd4c709f2a26d9f4fee4f4dc0/typer-0.26.8-py3-none-any.whl"
    sha256 "3512ca79ac5c11113414b36e80281b872884477722440691c89d1112e321a49c"
  end

  resource "typing-inspection" do
    url "https://files.pythonhosted.org/packages/dc/9b/47798a6c91d8bdb567fe2698fe81e0c6b7cb7ef4d13da4114b41d239f65d/typing_inspection-0.4.2-py3-none-any.whl"
    sha256 "4ed1cacbdc298c220f1bd249ed5287caa16f34d44ef4e9c3d0cbad5b521545e7"
  end

  resource "typing_extensions" do
    url "https://files.pythonhosted.org/packages/49/d3/b8441a820a491ddfc024b0b0cf0393375b75ea13866d9c66727e54c2fc80/typing_extensions-4.16.0-py3-none-any.whl"
    sha256 "481caa481374e813c1b176ada14e97f1f67a4539ce9cfeb3f350d78d6370c2e8"
  end

  resource "uncalled-for" do
    url "https://files.pythonhosted.org/packages/3b/25/2c87754f3a9e692315f7b811244090e68f362979fc8886b3fbd2985a1d8c/uncalled_for-0.3.2-py3-none-any.whl"
    sha256 "0ff60b142c7d1f8070bde9d42afaa70aedc77dcc10998c227687e9c15713418e"
  end

  resource "uvicorn" do
    url "https://files.pythonhosted.org/packages/45/ec/dbb7e5a6b91f86bfb9eb7d2988a2730907b6a729875b949c7f022e8b88fa/uvicorn-0.51.0-py3-none-any.whl"
    sha256 "5d38af6cd620f2ae3849fb44fd4879e0890aa1febe8d47eb355fb45d93fe6a5b"
  end

  resource "watchfiles" do
    url "https://files.pythonhosted.org/packages/31/3a/0da302f2307aee316922806ebd5726c542cbd787c938271cf14a074c7daf/watchfiles-1.2.0-cp313-cp313-macosx_11_0_arm64.whl"
    sha256 "7ba0480b9a74af058f43b337e937a451e109295c420916d68ad24e3dc02f5e44"
  end

  resource "websockets" do
    url "https://files.pythonhosted.org/packages/8b/76/b10633424d40681b4e892ffd08ca5226322b2426e62d4ab71eae484c3a32/websockets-16.1-cp313-cp313-macosx_11_0_arm64.whl"
    sha256 "187323204c3b2fc465e8fc2609e60437c521790cb9c1acb49c4c452a33e57f37"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"bh", "--help"
  end
end
