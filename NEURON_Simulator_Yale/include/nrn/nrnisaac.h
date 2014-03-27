#ifndef nrnisaac_h
#define nrnisaac_h

#include <nrnconf.h>
#if defined(HAVE_STDINT_H)
#include <stdint.h>
#endif

#if defined(__cplusplus)
extern "C" {
#endif

void* nrnisaac_new();
void nrnisaac_delete(void* rng);
void nrnisaac_init(void* rng, unsigned long int seed);
double nrnisaac_dbl_pick(void* rng);
uint32_t nrnisaac_uint32_pick(void* rng);

#if defined(__cplusplus)
}
#endif

#endif
