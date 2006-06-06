#!/pro/bin/perl

# (c)'06 H.Merijn Brand [ 09 Apr 2006 ]

# Small script to regenerate the links in U/all, that should
# represent all the modules used in the current Configure
# except the default dist libs

use strict;
use warnings;

use File::Copy;

my $meta = "/pro/3gl/CPAN/metaconfig";
my $perl = "/pro/3gl/CPAN/perl-current";
# the files that metaconfig might (probably will) overwrite:
my @safe = qw( Configure config_h.SH );

chdir $meta or die "no $meta";
mkdir  "U/all";	# Ignore error if already exists
chdir  "U/all";
unlink <*.U >;

for (@safe) {
    unlink $_;
    copy "$perl/$_", $_;
    }

@ARGV = ("metaconfig -v -m 2>&1 |");
while (<>) {
    s{^\s+$perl/U}{} or next;
    chomp;
    (my $f = $_) =~ s{.*/}{};
    (my $l = "../$_") =~ s{//+}{/}g;
    symlink $l, $f;
    }

for (qw( Configure config_h.SH )) {
    unlink "$perl/$_";
    move $_, "$perl/$_";
    }

__END__
The list of files that were linked before I started this script:
U/all/abortsig.U
U/all/alignbytes.U
U/all/ansi2knr.U
U/all/archlib.U
U/all/archname.U
U/all/atolf.U
U/all/atoll.U
U/all/bincompat3.U
U/all/bincompat5005.U
U/all/bin.U
U/all/bitpbyte.U
U/all/byteorder.U
U/all/ccflags.U
U/all/cc.U
U/all/cf_email.U
U/all/cf_who.U
U/all/charorder.U
U/all/charsize.U
U/all/Checkcc.U
U/all/Compile.U
U/all/Config_h.U
U/all/Config_sh.U
U/all/cppstdin.U
U/all/cpp_stuff.U
U/all/Cppsym.U
U/all/Csym.U
U/all/d_access.U
U/all/d_accessx.U
U/all/d_asctime_r.U
U/all/d_attribut.U
U/all/dbm64.U
U/all/d_builtin.U
U/all/d_casti32.U
U/all/d_castneg.U
U/all/d_class.U
U/all/d_clearenv.U
U/all/d_clock_getres.U
U/all/d_clock_gettime.U
U/all/d_clock_settime.U
U/all/d_closedir.U
U/all/d_cmsghdr_s.U
U/all/d_crypt_r.U
U/all/d_csh.U
U/all/d_ctime_r.U
U/all/d_dirfd.U
U/all/d_dirname_r.U
U/all/d_dlsymun.U
U/all/d_drand48proto.U
U/all/d_drand48_r.U
U/all/d_eaccess.U
U/all/d_endgrent_r.U
U/all/d_endgrent.U
U/all/d_endhent.U
U/all/d_endnent.U
U/all/d_endpent.U
U/all/d_endpwent_r.U
U/all/d_endpwent.U
U/all/d_endsent.U
U/all/d_endspent.U
U/all/d_eofpipe.U
U/all/Devel.U
U/all/devtype.U
U/all/d_fchdir.U
U/all/d_fcntl_can_lock.U
U/all/d_fd_set.U
U/all/d_finitel.U
U/all/d_finite.U
U/all/d_flexfnam.U
U/all/d_fpclassify.U
U/all/d_fp_class_l.U
U/all/d_fp_classl.U
U/all/d_fp_class.U
U/all/d_fpclass.U
U/all/d_fpos64_t.U
U/all/d_frexpl.U
U/all/d_fs_data_s.U
U/all/d_fseeko.U
U/all/d_fstatfs.U
U/all/d_fsync.U
U/all/d_ftello.U
U/all/d_futimes.U
U/all/d__fwalk.U
U/all/d_gconvert.U
U/all/d_getcwd.U
U/all/d_getespwnam.U
U/all/d_getfsstat.U
U/all/d_getgrent_r.U
U/all/d_getgrent.U
U/all/d_getgrgid_r.U
U/all/d_getgrnam_r.U
U/all/d_gethbyad.U
U/all/d_gethbynm.U
U/all/d_gethent.U
U/all/d_gethname.U
U/all/d_gethostprotos.U
U/all/d_getitimer.U
U/all/d_getlogin_r.U
U/all/d_getmntent_r.U
U/all/d_getmntent.U
U/all/d_getmntinfo_r.U
U/all/d_getmnt.U
U/all/d_getnbyad.U
U/all/d_getnbynm.U
U/all/d_getnent.U
U/all/d_getnetprotos.U
U/all/d_getpagsz.U
U/all/d_getpent.U
U/all/d_getpgrp.U
U/all/d_getprotby.U
U/all/d_getprotoprotos.U
U/all/d_getprpwnam.U
U/all/d_getpwent_r.U
U/all/d_getpwent.U
U/all/d_getpwnam_r.U
U/all/d_getpwuid_r.U
U/all/d_getrlimit.U
U/all/d_getsent.U
U/all/d_getservprotos.U
U/all/d_getspent_r.U
U/all/d_getspent.U
U/all/d_getspnam_r.U
U/all/d_getspnam.U
U/all/d_getsrvby.U
U/all/d_gmtime_r.U
U/all/d_gnulibc.U
U/all/d_hasmntopt.U
U/all/d_htonl.U
U/all/d_iconv.U
U/all/d_int64_t.U
U/all/d_iovec_s.U
U/all/d_isascii.U
U/all/d_isfinite.U
U/all/d_isinf.U
U/all/d_isnanl.U
U/all/d_isnan.U
U/all/d_keepsig.U
U/all/d_lchmod.U
U/all/d_lchown.U
U/all/d_ldbl_dig.U
U/all/dlext.U
U/all/d_libm_lib_version.U
U/all/d_llseek.U
U/all/d_localtime_r.U
U/all/d_longdbl.U
U/all/d_longlong.U
U/all/d_lseekproto.U
U/all/dlsrc.U
U/all/d_lutimes.U
U/all/d_madvise.U
U/all/d_malloc_size.U
U/all/d_memchr.U
U/all/d_mkdtemp.U
U/all/d_mknod.U
U/all/d_mkstemps.U
U/all/d_mkstemp.U
U/all/d_mmap.U
U/all/d_modfl.U
U/all/d_mprotect.U
U/all/d_mq_close.U
U/all/d_mq_getattr.U
U/all/d_mq_notify.U
U/all/d_mq_open.U
U/all/d_mq_receive.U
U/all/d_mq_send.U
U/all/d_mq_setattr.U
U/all/d_mq_unlink.U
U/all/d_msghdr_s.U
U/all/d_msg.U
U/all/d_nanosleep.U
U/all/d_NOFILE.U
U/all/d_off64_t.U
U/all/d_open3.U
U/all/doublesize.U
U/all/d_portable.U
U/all/d_posix_clock.U
U/all/d_posix_mq.U
U/all/d_posix_sched.U
U/all/d_posix_sem.U
U/all/d_posix_shm.U
U/all/d_posix_timer.U
U/all/d_printfed.U
U/all/d_pthrattrj.U
U/all/d_pthreadj.U
U/all/d_pthread_y.U
U/all/d_qgcvt.U
U/all/d_random_r.U
U/all/d_rand_r.U
U/all/d_readdir_r.U
U/all/d_readv.U
U/all/d_recvmsg.U
U/all/d_safebcpy.U
U/all/d_safemcpy.U
U/all/d_sanemcmp.U
U/all/d_sbrkproto.U
U/all/d_scannl.U
U/all/d_sched_getparam.U
U/all/d_sched_getscheduler.U
U/all/d_sched_gpmax.U
U/all/d_sched_gpmin.U
U/all/d_sched_rrgi.U
U/all/d_sched_setparam.U
U/all/d_sched_setscheduler.U
U/all/d_sem_close.U
U/all/d_sem_destroy.U
U/all/d_sem_getvalue.U
U/all/d_sem_init.U
U/all/d_sem_open.U
U/all/d_sem_post.U
U/all/d_sem_trywait.U
U/all/d_sem.U
U/all/d_sem_unlink.U
U/all/d_sem_wait.U
U/all/d_sendmsg.U
U/all/d_setgrent_r.U
U/all/d_setgrent.U
U/all/d_setgrps.U
U/all/d_sethent.U
U/all/d_setitimer.U
U/all/d_setnent.U
U/all/d_setpent.U
U/all/d_setpgrp.U
U/all/d_setproctitle.U
U/all/d_setpwent_r.U
U/all/d_setpwent.U
U/all/d_setrlimit.U
U/all/d_setsent.U
U/all/d_setspent.U
U/all/d_setvbuf.U
U/all/d_sfio.U
U/all/d_sgndchr.U
U/all/d_shm_open.U
U/all/d_shm.U
U/all/d_shm_unlink.U
U/all/d_sigaction.U
U/all/d_sigqueue.U
U/all/d_sigsetjmp.U
U/all/d_sigtimedwait.U
U/all/d_sigwaitinfo.U
U/all/d_sigwait.U
U/all/d_sitecustomize.U
U/all/d_snprintf.U
U/all/d_socket.U
U/all/d_socklen_t.U
U/all/d_socks5_init.U
U/all/d_sprintf_len.U
U/all/d_sqrtl.U
U/all/d_srand48_r.U
U/all/d_srandom_r.U
U/all/d_statblks.U
U/all/d_statfs3.U
U/all/d_statfs4.U
U/all/d_statfs_f_flags.U
U/all/d_statfs_s.U
U/all/d_statfs.U
U/all/d_statvfs.U
U/all/d_stdstdio.U
U/all/d_strerror_r.U
U/all/d_strerror.U
U/all/d_strtold.U
U/all/d_strtoll.U
U/all/d_strtoq.U
U/all/d_strtoull.U
U/all/d_strtoul.U
U/all/d_strtouq.U
U/all/d_telldirproto.U
U/all/d_timer_create.U
U/all/d_timer_delete.U
U/all/d_timer_getoverrun.U
U/all/d_timer_gettime.U
U/all/d_timer_settime.U
U/all/d_times.U
U/all/d_time.U
U/all/d_tmpnam_r.U
U/all/d_ualarm.U
U/all/d_union_semun.U
U/all/d_unorderedl.U
U/all/d_unordered.U
U/all/d_unsetenv.U
U/all/d_ustat.U
U/all/d_utimes.U
U/all/d_vfork.U
U/all/d_voidsig.U
U/all/d_vprintf.U
U/all/d_wifstat.U
U/all/d_writev.U
U/all/ebcdic.U
U/all/End.U
U/all/errnolist.U
U/all/Extensions.U
U/all/Extractall.U
U/all/Extract.U
U/all/fflushall.U
U/all/Findhdr.U
U/all/Finish.U
U/all/floatsize.U
U/all/fpossize.U
U/all/fpostype.U
U/all/fpu.U
U/all/gccvers.U
U/all/Getfile.U
U/all/gidf.U
U/all/gidsign.U
U/all/gidsize.U
U/all/gidtype.U
U/all/groupstype.U
U/all/Guess.U
U/all/Hasfield.U
U/all/Hasproto.U
U/all/Hasstruct.U
U/all/Head.U
U/all/html1dir.U
U/all/html3dir.U
U/all/i_db.U
U/all/i_fp_class.U
U/all/i_grp.U
U/all/i_iconv.U
U/all/i_ieeefp.U
U/all/i_inttypes.U
U/all/i_libutil.U
U/all/i_machcthr.U
U/all/i_malloc.U
U/all/i_mntent.U
U/all/i_mqueue.U
U/all/inc_version_list.U
U/all/i_netdb.U
U/all/i_netinettcp.U
U/all/Inhdr.U
U/all/i_nlist.U
U/all/inotype.U
U/all/installprefix.U
U/all/installstyle.U
U/all/Instruct.U
U/all/instubperl.U
U/all/intsize.U
U/all/i_poll.U
U/all/i_prot.U
U/all/i_pthread.U
U/all/i_pwd.U
U/all/i_sched.U
U/all/i_semaphore.U
U/all/i_shadow.U
U/all/i_socks.U
U/all/issymlink.U
U/all/i_sunmath.U
U/all/i_sysaccess.U
U/all/i_syslog.U
U/all/i_sysmman.U
U/all/i_sysmode.U
U/all/i_sysmount.U
U/all/i_sysrusage.U
U/all/i_syssecrt.U
U/all/i_sysstatfs.U
U/all/i_sysstatvfs.U
U/all/i_sysuio.U
U/all/i_sysutsname.U
U/all/i_sysvfs.U
U/all/i_time.U
U/all/i_ulimit.U
U/all/i_ustat.U
U/all/libc.U
U/all/libnlist.U
U/all/libperl.U
U/all/libpth.U
U/all/libs.U
U/all/lib.U
U/all/lns.U
U/all/localarch.U
U/all/locallib.U
U/all/Loc_ar.U
U/all/Loc.U
U/all/longdblfio.U
U/all/lseektype.U
U/all/mad.U
U/all/mallocsrc.U
U/all/man1dir.U
U/all/man3dir.U
U/all/mandirstyle.U
U/all/mandirs.U
U/all/Mksymlinks.U
U/all/models.U
U/all/modetype.U
U/all/multiarch.U
U/all/myhostname.U
U/all/Myinit.U
U/all/Myread.U
U/all/nblock_io.U
U/all/need_va_copy.U
U/all/netdbtype.U
U/all/nis.U
U/all/oldarchlib.U
U/all/Oldconfig.U
U/all/Oldsym.U
U/all/Options.U
U/all/orderlib.U
U/all/otherlibdirs.U
U/all/pager.U
U/all/patchlevel.U
U/all/perl5.U
U/all/perladmin.U
U/all/perlpath.U
U/all/perlxvf.U
U/all/perlxv.U
U/all/pidsign.U
U/all/pidsize.U
U/all/pidtype.U
U/all/prefix.U
U/all/privlib.U
U/all/Protochk.U
U/all/ptrsize.U
U/all/quadfio.U
U/all/quadtype.U
U/all/randbits.U
U/all/randfunc.U
U/all/sbrksmart.U
U/all/scriptdir.U
U/all/selectminbits.U
U/all/selecttype.U
U/all/Setprefixvar.U
U/all/Signal.U
U/all/sig_name.U
U/all/sitearch.U
U/all/sitebin.U
U/all/sitehtml1dir.U
U/all/sitehtml1.U
U/all/sitehtml3dir.U
U/all/sitehtml3.U
U/all/sitelib.U
U/all/siteman1dir.U
U/all/siteman1.U
U/all/siteman3dir.U
U/all/siteman3.U
U/all/siteprefix.U
U/all/sitescriptdir.U
U/all/sitescript.U
U/all/sizesize.U
U/all/sizetype.U
U/all/sockopt.U
U/all/socksizetype.U
U/all/so.U
U/all/spitshell.U
U/all/src.U
U/all/ssizesize.U
U/all/ssizetype.U
U/all/startperl.U
U/all/stdchar.U
U/all/stdio64.U
U/all/stdio_streams.U
U/all/sunscanf.U
U/all/trnl.U
U/all/Tr.U
U/all/Typedef.U
U/all/uidf.U
U/all/uidsign.U
U/all/uidsize.U
U/all/uidtype.U
U/all/Unix.U
U/all/use64bits.U
U/all/uselfs.U
U/all/uselongdbl.U
U/all/uselonglong.U
U/all/usemorebits.U
U/all/usemultiplicity.U
U/all/usenm.U
U/all/useperlio.U
U/all/usesocks.U
U/all/usethreads.U
U/all/usrinc.U
U/all/vendorarch.U
U/all/vendorbin.U
U/all/vendorhtml1dir.U
U/all/vendorhtml1.U
U/all/vendorhtml3dir.U
U/all/vendorhtml3.U
U/all/vendorlib.U
U/all/vendorman1dir.U
U/all/vendorman1.U
U/all/vendorman3dir.U
U/all/vendorman3.U
U/all/vendorprefix.U
U/all/vendorscript.U
U/all/versiononly.U
U/all/voidflags.U
U/all/xs_apiversion.U