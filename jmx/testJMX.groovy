import javax.management.MBeanServerConnection
import javax.management.remote.JMXConnectorFactory
import javax.management.remote.JMXServiceURL

def agentUrl = "service:jmx:rmi:///jndi/rmi://localhost:9004/jmxrmi"
def connector = JMXConnectorFactory.connect(new JMXServiceURL(agentUrl))
def server = connector.getMBeanServerConnection()
//def server = connector.mBeanServerConnection // NOTE: does not work in Grails 1.3, replaced with previous line

println "Number of registered MBeans: ${server.getMBeanCount()}"

println "\nRegistered Domains:"
server.domains.each{println it}

println "\nRegistered MBeans:"
server.queryNames(null, null).each{println it}

println "\nHere is the Runtime MBean:"
def mbean = new GroovyMBean(server, "java.lang:type=Runtime")
println mbean

println "\nHere are the InputArguments:"
mbean.InputArguments.each{println it}