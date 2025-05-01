function dsc = calculateDSC(seg, ref)

dimensions = size(ref);
top_count = 0;
bot_count = 0;
for j = 1:dimensions(1)
    for i = 1:dimensions(2)
        if seg(j, i) == ref(j, i)
            top_count = top_count + 1;
        else
            bot_count = bot_count + 1;
        end
    end
end
dsc = double(2 * (top_count / bot_count));
end