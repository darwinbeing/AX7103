webtalk_init -webtalk_dir Y:/project/AX/AX7102/CD/02_demo/11_ddr3_test/ddr3_test/ddr3_test.hw/webtalk/
webtalk_register_client -client project
webtalk_add_data -client project -key date_generated -value "Wed Jul 05 19:02:03 2017" -context "software_version_and_target_device"
webtalk_add_data -client project -key product_version -value "Vivado v2015.4 (64-bit)" -context "software_version_and_target_device"
webtalk_add_data -client project -key build_version -value "1412921" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_platform -value "WIN64" -context "software_version_and_target_device"
webtalk_add_data -client project -key registration_id -value "" -context "software_version_and_target_device"
webtalk_add_data -client project -key tool_flow -value "xsim_vivado" -context "software_version_and_target_device"
webtalk_add_data -client project -key beta -value "FALSE" -context "software_version_and_target_device"
webtalk_add_data -client project -key route_design -value "FALSE" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_family -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_device -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_package -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_speed -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key random_id -value "c6b4edbcd7cc5d9cb7b85c6a13e8562a" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_id -value "3cc1e222-fc9c-4f5c-a430-72fdd88e96cf" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_iteration -value "15" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_name -value "Microsoft Windows 7 , 64-bit" -context "user_environment"
webtalk_add_data -client project -key os_release -value "major release  (build 7600)" -context "user_environment"
webtalk_add_data -client project -key cpu_name -value "Intel(R) Core(TM) i5-4590 CPU @ 3.30GHz" -context "user_environment"
webtalk_add_data -client project -key cpu_speed -value "3300 MHz" -context "user_environment"
webtalk_add_data -client project -key total_processors -value "1" -context "user_environment"
webtalk_add_data -client project -key system_ram -value "7.000 GB" -context "user_environment"
webtalk_register_client -client labtool
webtalk_add_data -client labtool -key pgmcnt -value "00:00:00" -context "labtool\\usage"
webtalk_add_data -client labtool -key cable -value "" -context "labtool\\usage"
webtalk_transmit -clientid 194293893 -regid "" -xml Y:/project/AX/AX7102/CD/02_demo/11_ddr3_test/ddr3_test/ddr3_test.hw/webtalk/usage_statistics_ext_labtool.xml -html Y:/project/AX/AX7102/CD/02_demo/11_ddr3_test/ddr3_test/ddr3_test.hw/webtalk/usage_statistics_ext_labtool.html -wdm Y:/project/AX/AX7102/CD/02_demo/11_ddr3_test/ddr3_test/ddr3_test.hw/webtalk/usage_statistics_ext_labtool.wdm -intro "<H3>LABTOOL Usage Report</H3><BR>"
webtalk_terminate