package Mstar.IR;

import Mstar.IR.Operand.PhysicalRegister;
import Mstar.IR.Operand.VirtualRegister;

import java.util.LinkedList;

public class RegisterSet {
    public static PhysicalRegister rax;
    public static PhysicalRegister rcx;
    public static PhysicalRegister rdx;
    public static PhysicalRegister rbx;
    public static PhysicalRegister rsp;
    public static PhysicalRegister rbp;
    public static PhysicalRegister rsi;
    public static PhysicalRegister rdi;
    public static PhysicalRegister r8;
    public static PhysicalRegister r9;
    public static PhysicalRegister r10;
    public static PhysicalRegister r11;
    public static PhysicalRegister r12;
    public static PhysicalRegister r13;
    public static PhysicalRegister r14;
    public static PhysicalRegister r15;

    public static LinkedList<PhysicalRegister> allRegs;
    public static LinkedList<PhysicalRegister> callerSave;
    public static LinkedList<PhysicalRegister> calleeSave;
    public static LinkedList<PhysicalRegister> args;

    public static VirtualRegister vrax;
    public static VirtualRegister vrcx;
    public static VirtualRegister vrdx;
    public static VirtualRegister vrbx;
    public static VirtualRegister vrsp;
    public static VirtualRegister vrbp;
    public static VirtualRegister vrsi;
    public static VirtualRegister vrdi;
    public static VirtualRegister vr8;
    public static VirtualRegister vr9;
    public static VirtualRegister vr10;
    public static VirtualRegister vr11;
    public static VirtualRegister vr12;
    public static VirtualRegister vr13;
    public static VirtualRegister vr14;
    public static VirtualRegister vr15;

    public static LinkedList<VirtualRegister> vallRegs;
    public static LinkedList<VirtualRegister> vcalleeSave;
    public static LinkedList<VirtualRegister> vcallerSave;
    public static LinkedList<VirtualRegister> vargs;


    public static void init() {
        allRegs = new LinkedList<>();
        calleeSave = new LinkedList<>();
        callerSave = new LinkedList<>();
        args = new LinkedList<>();
        vallRegs = new LinkedList<>();
        vcalleeSave = new LinkedList<>();
        vcallerSave = new LinkedList<>();
        vargs = new LinkedList<>();
        String[] names = new String[]{
                "rax", "rcx", "rdx", "rbx", "rsp", "rbp", "rsi", "rdi", "r8", "r9", "r10", "r11", "r12", "r13", "r14", "r15",
        };
        Boolean[] isCallerSave = new Boolean[]{
                true,  true,  true,  false, null,  null, true,  true,  true, true, true,  true,  false, false, false, false
        };
        for (int i = 0; i < 16; i++) {
            PhysicalRegister pr = new PhysicalRegister();
            VirtualRegister vr = new VirtualRegister("v" + names[i]);
            pr.name = names[i];
            vr.allocatedPhysicalRegister = pr;
            allRegs.add(pr);
            vallRegs.add(vr);
            if(isCallerSave[i] != null) {
                if(isCallerSave[i]) {
                    callerSave.add(pr);
                    vcallerSave.add(vr);
                } else {
                    calleeSave.add(pr);
                    vcalleeSave.add(vr);
                }
            }
        }
        rax = allRegs.get(0);    vrax = vallRegs.get(0);
        rcx = allRegs.get(1);    vrcx = vallRegs.get(1);
        rdx = allRegs.get(2);    vrdx = vallRegs.get(2);
        rbx = allRegs.get(3);    vrbx = vallRegs.get(3);
        rsp = allRegs.get(4);    vrsp = vallRegs.get(4);
        rbp = allRegs.get(5);    vrbp = vallRegs.get(5);
        rsi = allRegs.get(6);    vrsi = vallRegs.get(6);
        rdi = allRegs.get(7);    vrdi = vallRegs.get(7);
        r8 = allRegs.get(8);     vr8  = vallRegs.get(8);
        r9 = allRegs.get(9);     vr9  = vallRegs.get(9);
        r10 = allRegs.get(10);   vr10 = vallRegs.get(10);
        r11 = allRegs.get(11);   vr11 = vallRegs.get(11);
        r12 = allRegs.get(12);   vr12 = vallRegs.get(12);
        r13 = allRegs.get(13);   vr13 = vallRegs.get(13);
        r14 = allRegs.get(14);   vr14 = vallRegs.get(14);
        r15 = allRegs.get(15);   vr15 = vallRegs.get(15);
        args.add(rdi); vargs.add(vrdi);
        args.add(rsi); vargs.add(vrsi);
        args.add(rdx); vargs.add(vrdx);
        args.add(rcx); vargs.add(vrcx);
        args.add(r8);  vargs.add(vr8);
        args.add(r9);  vargs.add(vr9);
    }
}
