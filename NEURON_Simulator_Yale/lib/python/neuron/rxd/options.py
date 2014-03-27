try:
    import scipy
except:
    raise Exception("NEURON's rxd module requires scipy")

import warnings

scipy_version = [int(v) for v in scipy.__version__.split('.')]

if scipy_version[0] > 0 or scipy_version[1] > 10 or (scipy_version[1] == 10 and scipy_version[2] >= 1):
    use_reaction_contribution_to_jacobian = True
    """Should we use the reaction contribution to the Jacobian? probably yes if cvode"""
else:
    warnings.warn('scipy < 0.10.1 found; setting rxd.options.use_reaction_contribution_to_jacobian = False to avoid a memory leak in scipy.sparse.linalg.factorized')
    use_reaction_contribution_to_jacobian = False

