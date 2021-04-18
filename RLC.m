function Enc_Seq=RLC(ins)
Indx=find(ins);
L=length(Indx);
One_C=1; Zero_C =0; Enc_Seq=[]; S=0;% One count, zero count, encoding sequence
for i=1:(L-1)
    % If sequence is starting with zeros
    if (Indx(1)>1) && (S==0)
       Zero_C=Indx(1)-1;
       Enc_Seq=[Enc_Seq;0,Zero_C];
       Zero_C=0; S=1;
    end
    
    if (Indx(i+1)-Indx(i))==1
        One_C=One_C+1;
        up=0;
    else
        Zero_C=Indx(i+1)-Indx(i)-1;
        Enc_Seq=[Enc_Seq;1,One_C;0,Zero_C];
        One_C=1; Zero_C=0;
        up=1; %Update pointer
    end
    
    % To update no. of one's if sequence is ended with one's;
    if (up==0) && (i==(L-1))
        Enc_Seq=[Enc_Seq;1,One_C];
    end
end