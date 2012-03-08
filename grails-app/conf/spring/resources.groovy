import org.springframework.jmx.support.MBeanServerFactoryBean
import org.springframework.jmx.export.MBeanExporter
import org.apache.log4j.jmx.HierarchyDynamicMBean

beans = {
	log4jBean(HierarchyDynamicMBean)

	mbeanServer(MBeanServerFactoryBean) { locateExistingServerIfPossible=true }

	exporter(MBeanExporter) {
		server = mbeanServer
		beans = ["log4j:hierarchy=default":log4jBean]
	}
}