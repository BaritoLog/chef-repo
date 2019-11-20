import subprocess
import re
from checks import AgentCheck
class ZfsFreeCheck(AgentCheck):
  def check(self, instance):
    pool = instance['storage_pool']
    cmd  = subprocess.check_output(['zfs', 'get', '-Hp', 'available', pool]).decode("utf-8")
    rgx = re.findall(r'-?\d+\.?\d*', cmd)
    res = float(rgx[0])
    self.gauge('system.zfs.free', res, tags=['pool:{pool}'])
